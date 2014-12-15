require "./app"

enable :sessions

configure :development, :test do
  register Sinatra::Reloader
  set :session_secret, '*&(^B234'
end

configure :production do
  set :session_secret, ENV['SECRET_KEY']
  ActiveRecord::Base.logger.level = 1
end


map '/assets' do
  public_folder = File.join(App.root, '/public')

  App.sprockets.append_path File.join(App.root, "assets", "stylesheets")
  App.sprockets.append_path File.join(App.root, "assets", "javascripts")
  App.sprockets.append_path File.join(App.root, "assets", "images")
  App.sprockets.append_path File.join(App.root, "bower_components")

  configure :production do
    App.sprockets.js_compressor  = :uglify
    App.sprockets.css_compressor = :scss
  end
  
  Sprockets::Helpers.configure do |config|
    config.environment = App.sprockets
    config.prefix      = '/assets'
    config.public_path = public_folder
  end

  run App.sprockets
end

run Rack::Cascade.new [Api, App]
