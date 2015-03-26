class SlackApi < Sinatra::Base
	
	get '/api/checkmail' do 
		process_unread_mail
	end

end