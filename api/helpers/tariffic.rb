require 'httparty'
def cache_customers
	customers=fetch_api_customers
	write_json_file("tariffic_customers.json",customers)
end

def fetch_customers
	if File.exist?("tariffic_customers.json") 
		 fetch_local_customers
	else
		cache_customers
		fetch_local_customers
	end
end

def fetch_api_customers
	HTTParty.get(ENV['api_url'],{:basic_auth => {:username => ENV['tariffic_api_user'], :password => ENV['tariffic_api_pass']}, :timeout => 180})
end

def fetch_local_customers
	read_json_file('tariffic_customers.json')
end

def get_customer_size(customer_name)
	fetch_customers.each do |customer|
		if customer['Name'].downcase==customer_name.downcase
			return "#{customer_name} size: "+customer['LineCount'].to_s
		end
	end
	"Customer #{customer_name} not found"
end

def display_customers
	disp="Tariffic Customers:\n"
	customers=fetch_customers
	customers.each do |customer|
		disp << customer["Name"]+"\n"
	end
	disp
end