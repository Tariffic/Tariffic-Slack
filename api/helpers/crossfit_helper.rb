def display_crossfit_list
	crossfitters=get_crossfit_list
	list="Currently opted in: \n"
  crossfitters.each do |crossfitter|
    list=list+crossfitter+"\n"
  end
  list
end

def get_crossfit_list
  list=[]
  crossfitters=read_json_file('crossfit.json')
  crossfitters.each do |crossfitter|
    if crossfitter[1]
      list << crossfitter[0]
    end
  end
  list
end

def crossfit_opt_in(name)
  crossfitters=read_json_file('crossfit.json')
  name.empty? ? "" : crossfitters[name.downcase]=true
  write_json_file('crossfit.json',crossfitters)
  name+" opted in for next crossfit session"
end

def crossfit_opt_out(name)
  crossfitters=read_json_file('crossfit.json')
  name.empty? ? "" : crossfitters[name.downcase]=false
  write_json_file('crossfit.json',crossfitters)
  name+" opted out for next crossfit session"
end

def randomize
  crossfitters=get_crossfit_list.sample(15)
  File.open("random_crossfitters", 'w') do |file|
    crossfitters.each do |crossfitter|
      file.puts crossfitter
    end
    file.puts "Generated: "+Time.now.strftime("%d/%m/%Y %H:%M")+2*60*60
  end
  post_to_slack("https://hooks.slack.com/services/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",display_random_crossfitters,username="Crossfit Randomizer",icon_url=nil,icon_emoji=":muscle:",channel=nil)
  return crossfitters
end

def display_random_crossfitters
  display="The following crossfitters were randomly selected:\n"
  get_random_crossfitters.each do |crossfitter|
    display << crossfitter+"\n"
  end
  display
end

def get_random_crossfitters
  crossfitters=Array.new
  if File.exist?("random_crossfitters")
    File.read("random_crossfitters").each_line{|line|
      crossfitters.push line.chomp
    }
    return crossfitters
  else
    []
  end
end