require 'listen'
require 'faye/websocket'
require 'thread'
require 'rails' # Ensure Rails is loaded

module AutoReload
  class Server
    KEEPALIVE_TIME = 15 # in seconds

    def initialize(app)
      @app = app
      @clients = []

      # Start listening to file changes in the 'app/views' directory
      @listener = Listen.to('app/views') do |modified, added, removed|
        changed_files = modified + added + removed
        unless changed_files.empty?
          message = "[AutoReload] Detected changes in files: #{changed_files.join(', ')}"
          Rails.logger.info message
          @clients.each { |ws| ws.send('reload') }
        end
      end
      @listener.start
    end

    def call(env)
      if Faye::WebSocket.websocket?(env)
        ws = Faye::WebSocket.new(env, nil, ping: KEEPALIVE_TIME)

        ws.on :open do |_event|
          @clients << ws
        end

        ws.on :close do |_event|
          @clients.delete(ws)
          ws = nil
        end

        # Return async Rack response
        return ws.rack_response
      else
        @app.call(env)
      end
    end
  end
end
