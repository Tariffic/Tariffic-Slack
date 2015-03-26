
def is_authenticated(token)
  ENV['SlackToken']==token ? true : false
end