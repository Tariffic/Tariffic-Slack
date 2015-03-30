
def is_authenticated(token)
  ENV['SlackToken']==token || ENV['SlackToken2']==token ? true : false
end
