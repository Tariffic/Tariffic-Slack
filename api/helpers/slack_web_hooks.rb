require 'httparty'

def post_to_slack(webhook_url,text,username=nil,icon_url=nil,icon_emoji=nil,channel=nil)
	HTTParty.post(webhook_url, 
	    :body => { 
	    					:text => text,
	    		   		:username => username,
	    		   		:icon_emoji => icon_emoji,
	    		   		:icon_url => icon_url,
	    		   		:channel => channel
	             }.to_json,
	    :headers => { 'Content-Type' => 'application/json' } )
end

