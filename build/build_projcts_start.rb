# Project Choose ========================================
require File.dirname(__FILE__)+'/config/config.rb'

puts "\n\n\n\n\n\n"
puts "\033[31m☞请选择你要编译的项目？\n\033[0m"

# setting ========================================
projects = Abyss::Build::Config::PROJECTS

out = Abyss::Build::Config::OUTPUT_PATH
fir_token = Abyss::Build::Config::FIR_TOKEN

# setting ========================================
count = 1
for proj in projects
	puts "#{count.to_int}.==>"+proj["name"]
	count = count + 1
end

tag = gets.chomp

# Project Choose ========================================

# Deel 

projectTag = 0
while (tag != "1" && tag != "2" && tag != "3")
	tag = gets.chomp
end

if tag == "1" then projectTag = 0
elsif tag == "2" then projectTag = 1
elsif tag == "3" then projectTag = 2	
end

# Start Build

path = projects[projectTag]["path"]
scheme = projects[projectTag]["scheme"]

# Make Shell
# system "cd #{path}"
shell = "cd #{path} && fastlane scheme:#{scheme} out:#{out} project:#{path} fir_token:#{fir_token}"
puts "\033[31m☞准备执行:" + shell + "\033[0m"
puts "☞\n"
system shell 