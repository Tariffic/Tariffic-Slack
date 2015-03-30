class SlackApi < Sinatra::Base
	
	get '/checkmail' do 
		process_unread_mail
	end

	get '/tariffic/customers' do
		display_customers
	end

	get '/tariffic/size/:customer' do |customer|
		get_customer_size(customer)
	end

end