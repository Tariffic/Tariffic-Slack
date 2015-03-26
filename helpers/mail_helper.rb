require 'mail'
Mail.defaults do
  retriever_method :pop3, :address    => "outlook.office365.com",
                          :port       => 995,
                          :user_name  => ENV['pay_email_address'],
                          :password   => ENV['pay_password'],
                          :enable_ssl => true
end

def check_mail
	emails = Mail.find(:what => :last,:count => 4,:order => :asc)
end

def process_unread_mail
	check_mail.each do |email|
    unless email_has_been_processed(email.message_id)
      append_processed_email(email.message_id)
      if email.body.decoded.downcase.include? "keyword"
      	post_to_slack("https://hooks.slack.com/services/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","Payment Received!",username="Cha-Ching!",icon_url=nil,icon_emoji=":dollar:",channel=nil)
      end
    end
  end
end

def append_processed_email(email)
  open('receivedmails', 'a') { |f|
    f.puts email
  }
end

def email_has_been_processed(email)
  emails=read_already_processed_emails
  	emails.each do |processed_email|
  		if email==processed_email
  			return true
  		end
  	end
  	false
end

def read_already_processed_emails
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