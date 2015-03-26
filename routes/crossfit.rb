require 'erb'
class Slack < Sinatra::Base

	get '/crossfit' do
		@crossfit_list=crossfit_list_table_html
		erb :index
	end

	get '/crossfit/list' do
		display_crossfit_list
	end

	get '/crossfit/in' do
		crossfit_opt_in(params[:user_name])
	end

	get '/crossfit/out' do
		crossfit_opt_out(params[:user_name])
	end

	get '/crossfit/randomize/:amount' do
		##Generate random list of crossfitters
	end

end