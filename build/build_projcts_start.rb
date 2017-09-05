# Project Choose ========================================
# require File.dirname(__FILE__)+'/config/config.rb'

require "yaml"

puts "\033[32m 　　　＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
彡　 _／ ⌒ ⌒ 
　　/)) (●) (●) 　ヽ	 	what are u saying?
　 ｜∩　(_人_)　 |     	 	\033[0m\033[31m☞it`s Ascipt!\033[0m\033[32m
　 / ノ､＿ヽノ＿ノ￣) 		I`m Abyss!
　/ /　　　　　 /ﾌ_/ 
　L＿／＼　　　 ＼(	＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿\033[0m"


puts "\n\033[31m☞Now,Choose your project to build？\n\033[0m"
system "export FASTLANE_XCODEBUILD_SETTINGS_TIMEOUT=120"

# 输出路径
out = "/Users/abyss/Desktop/outputs/#{Time.now.strftime('%m%d')}"

# setting =======================\=================
config = YAML.load_file(File.dirname(__FILE__)+'/config/config.yml')


projects = config["Projects"]
fir_token = config["Publish"]["fir"]["token"]
matchUrl = config["Match"]["url"]
idendifiers = config["Match"]["idendifiers"]
plugins = config["Plugin"]

# Jenkins

tag = ARGV[0]; 
lane = ARGV[1];
isJenkins = false;

puts tag
puts lane
if tag.to_i > 0
	isJenkins = true
else
	tag = gets.chomp
	puts "\n请输入:"
end

# setting ========================================

# Project Choose ========================================

# Deel 
count = 1
for proj in projects
	puts "#{count.to_int}.==>"+proj["name"]
	count = count + 1
end

projectTag = 0
if tag.to_i > 0 && tag.to_i < count
	projectTag = tag.to_i - 1;
end

# Start Build

path = projects[projectTag]["path"]
scheme = projects[projectTag]["scheme"]

if isJenkins
	shell = "cd #{path} && fastlane #{lane} jenkins:true scheme:#{scheme} out:#{out} project:#{path} fir_token:#{fir_token} matchUrl:'#{matchUrl}' idendifiers:'#{idendifiers}' plugins:'#{plugins}'"
	puts "\033[31m☞准备执行:" + shell + "\033[0m"
	puts "☞\n"
	system shell 
else
	# Make Shell
	# system "cd #{path}"
	shell = "cd #{path} && fastlane scheme:#{scheme} out:#{out} project:#{path} fir_token:#{fir_token} matchUrl:'#{matchUrl}' idendifiers:'#{idendifiers}' plugins:'#{plugins}'"
	puts "\033[31m☞准备执行:" + shell + "\033[0m"
	puts "☞\n"
	system shell 
end