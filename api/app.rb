require 'sinatra/base'
require_relative 'cron/init'
require_relative 'helpers/init'
require_relative 'routes/init'

class SlackApi < Sinatra::Base

	before do
    unless is_authenticated(params[:token])
      halt 401, {'Content-Type' => 'text/plain'}, 'Unauthorized!'
    end
  end

	get '/' do
      params[:text].nil? ? sub_commands="" : (params[:text].empty? ? sub_commands="" : sub_commands = "/"+params[:text].split.join("/"))
      status, headers, body = call! env.merge("PATH_INFO" => "#{params[:command]}#{sub_commands}")
      [status, headers, body]
  end

end