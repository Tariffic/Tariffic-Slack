class SlackApi < Sinatra::Base
	
	get '/checkmail' do 
		process_unread_mail
	end

	get '/tariffic/customers' do
		display_customers
	end

	get '/tariffic/size/*' do
		get_customer_size(params[:splat].join(' '))
	end

end