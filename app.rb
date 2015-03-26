require 'sinatra/base'
require 'httparty'
require_relative 'presenters/init'
#require_relative 'api/app.rb'

class Slack < Sinatra::Base
  enable :method_override
  set :root, File.dirname(__FILE__)
  configure do
    set :app_file, __FILE__
  end
  
  # before do
  #   unless is_authenticated(params[:token])
  #     halt 401, {'Content-Type' => 'text/plain'}, 'Unauthorized!'
  #   end
  # end
 
  get '/' do
      "Hello World"
  end

  get '/crossfit' do
    token=ENV['SlackToken']
    result=HTTParty.get('http://localhost:9292/api/crossfit/list', 
      :body => { 
                :token => token
               })  
    result.body

  end

end