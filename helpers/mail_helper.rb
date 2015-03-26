require 'mail'
Mail.defaults do
  retriever_method :pop3, :address    => "outlook.office365.com",
                          :port       => 995,
                          :user_name  => ENV['pay_email_address'],
                          :password   => ENV['pay_password'],
                          :enable_ssl => true
end

def check_mail()
	
end