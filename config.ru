require File.join(File.dirname(__FILE__), 'app.rb')
require File.join(File.dirname(__FILE__), 'api/app.rb')
run Rack::URLMap.new(
   '/' => Slack.new,
   '/api' => SlackApi.new
  )