#resolution.rb
require 'pathname.rb'


fileName = $PROGRAM_NAME

[fileName, "./#{fileName}"].each do |fileName|
	puts fileName
	puts File.expand_path(fileName)
	puts
end

