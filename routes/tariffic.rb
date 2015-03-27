require 'sinatra/base'
class Slack < Sinatra::Base
	get '/tariffic/customers' do
			display_customers
	end
end