require 'erb'
class SlackApi < Sinatra::Base

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

	get '/crossfit/randomize' do
		crossfitters=""
		randomize.each do |crossfitter|
			crossfitters << crossfitter+"\n"
		end
		"The following crossfitters were randomly selected:\n"+crossfitters
	end

end