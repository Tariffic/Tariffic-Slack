require 'mail'
Mail.defaults do
  retriever_method :pop3, :address    => "outlook.office365.com",
                          :port       => 995,
                          :user_name  => ENV['pay_email_address'],
                          :password   => ENV['pay_password'],
                          :enable_ssl => true
end

def check_mail()
	emails = Mail.find(:what => :last,:count => 4,:order => :asc)
end

def append_processed_email(email)
  open('receivedmails', 'a') { |f|
    f.puts email
  }
end

def email_has_been_processed(email)
  emails=read_already_processed_emails_to_array()
  	emails.each do |processed_email|
  		if email==processed_email
  			return true
  		end
  	end
  	false
end

def read_already_processed_emails_to_array()
  emails=Array.new
  if File.exist?("receivedmails")
    File.read("receivedmails").each_line{|line|
    	emails.push line.chomp
    }
    return emails
  else
    []
  end
end