def crossfit_list_table_html
  html_out="<table><tr><th>Name</th></tr>"
  crossfitters=get_crossfit_list
  crossfitters.each do |crossfitter|
  	html_out << "<tr><td>#{crossfitter}</td></tr>"
  end
  html_out << "</table>"
end