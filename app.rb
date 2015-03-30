require 'sinatra/base'
require 'httparty'
require_relative 'api/helpers/init'
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
      params[:text].nil? ? sub_commands="" : (params[:text].empty? ? sub_commands="" : sub_commands = "/"+params[:text].split.join("/"))
      status, headers, body = call! env.merge("PATH_INFO" => "#{params[:command]}#{sub_commands}")
      [status, headers, body]
  end

  get '/crossfit' do
    token=ENV['SlackToken']
    api_url=ENV['api_url']
    @crossfit_list=get_crossfit_list
    @crossfit_random=get_random_crossfitters
    erb :index
  end



end