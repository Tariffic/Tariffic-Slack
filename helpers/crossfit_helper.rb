def display_crossfit_list
	crossfitters=read_json_file('crossfit.json')
	list="Currently opted in: \n"
  crossfitters.each do |crossfitter|
    if crossfitter[1]
      list=list+crossfitter[0]+"\n"
    end
  end
  list
end

def crossfit_opt_in(name)
  crossfitters=read_json_file('crossfit.json')
  crossfitters[name]=true
  write_json_file('crossfit.json',crossfitters)
  name+" opted in for next crossfit session"
end

def crossfit_opt_out(name)
  crossfitters=read_json_file('crossfit.json')
  crossfitters[name]=false
  write_json_file('crossfit.json',crossfitters)
  name+" opted out for next crossfit session"
end