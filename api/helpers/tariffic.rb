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
	HTTParty.get("http://7b3761e687cb42ceaabb33a50556113a.cloudapp.net/api/v1/customers",{:basic_auth => {:username => ENV['tariffic_api_user'], :password => ENV['tariffic_api_pass']}, :timeout => 180})
end

def fetch_local_customers
	read_json_file('tariffic_customers.json')
end

def get_customer_size(customer_name)
	fetch_customers.each do |customer|
		if customer['Name'].downcase==customer_name.downcase
			return customer['LineCount'].to_s
		end
	end
	status 404
	"Customer not found"
end