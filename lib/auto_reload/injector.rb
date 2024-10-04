module AutoReload
    class Injector
      def initialize(app)
        @app = app
      end
  
      def call(env)
        status, headers, response = @app.call(env)
  
        if headers['Content-Type']&.include?('text/html')
          body = ''
          response.each { |part| body << part }
          response.close if response.respond_to?(:close)
  
          # JavaScript code to connect to the WebSocket server
          script = <<-SCRIPT
            <script type="text/javascript">
              (function() {
                var ws = new WebSocket('ws://' + window.location.host + '/');
                ws.onmessage = function(event) {
                  if (event.data === 'reload') {
                    window.location.reload();
                  }
                };
              })();
            </script>
          SCRIPT
  
          body.sub!('</body>', script + '</body>')
          headers['Content-Length'] = body.bytesize.to_s
  
          [status, headers, [body]]
        else
          [status, headers, response]
        end
      end
    end
  end
  