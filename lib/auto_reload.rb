require 'auto_reload/server'
require 'auto_reload/injector'

module AutoReload
  class Railtie < Rails::Railtie
    initializer 'auto_reload.configure_middleware' do |app|
      app.middleware.use AutoReload::Injector
      app.middleware.insert_before Rack::Runtime, AutoReload::Server
    end
  end
end
