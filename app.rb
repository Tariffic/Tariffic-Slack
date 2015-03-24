require 'sinatra/base'
require_relative 'routes/init'
require_relative 'helpers/init'

class Slack < Sinatra::Base
  enable :method_override
  set :root, File.dirname(__FILE__)
  configure do
    set :app_file, __FILE__
  end
 
  before do
    unless is_authenticated(params[:token])
      halt 401, {'Content-Type' => 'text/plain'}, 'Unauthorized!'
    end
  end
 
  get '/' do
      params[:text].empty? ? sub_commands="" : sub_commands = "/"+params[:text].split.join("/")
      status, headers, body = call! env.merge("PATH_INFO" => "#{params[:command]}#{sub_commands}")
      [status, headers, body]
  end

end