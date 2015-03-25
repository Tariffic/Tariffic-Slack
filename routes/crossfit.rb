class Slack < Sinatra::Base

	get '/crossfit' do
		"This would be a view"
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

end