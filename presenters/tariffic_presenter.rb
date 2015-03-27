def display_customers
	disp="Tariffic Customers:\n"
	customers=fetch_customers
	customers.each do |customer|
		disp << customer["Name"]+"\n"
	end
	disp
end