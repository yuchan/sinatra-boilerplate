require 'bundler'
Bundler.require

include Sprockets::Helpers

class Api < Grape::API
  format :json
  prefix :api
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :sprockets, Sprockets::Environment.new(root)
  get '/' do
    haml :index
  end
end
