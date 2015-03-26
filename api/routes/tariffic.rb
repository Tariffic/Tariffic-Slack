class SlackApi < Sinatra::Base
	
	get '/checkmail' do 
		process_unread_mail
	end

end