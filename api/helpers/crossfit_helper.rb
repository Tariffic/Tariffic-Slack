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
  write_json_file("random_crossfitters",crossfitters)
  return crossfitters
end

def get_random_crossfitters
  crossfitters=[]
  if File.exist?("random_crossfitters")
    File.read("random_crossfitters").each_line{|line|
      crossfitters.push line.chomp
    }
  else
    []
  end
end