require 'json'
def read_json_file(file_name)
  if File.exist?(file_name)
    JSON.parse(File.read(file_name))
  else
    JSON.parse("{}")
  end
end

def write_json_file(file_name,content)
  File.open(file_name,"w") do |f|
    f.write(content.to_json)
  end
end