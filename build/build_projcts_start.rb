# Project Choose ========================================

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

config = YAML.load_file(File.dirname(__FILE__)+'/config/config.yml')
projects = config["Projects"]

tag = ARGV[0]; 
lane = ARGV[1];

# 处理逻辑
count = 1
for proj in projects
	puts "#{count.to_int}.==>"+proj["name"]
	count = count + 1
end

projectTag = 0
if tag.to_i > 0
	projectTag = tag.to_i
else
	tag = gets.chomp
	puts "\n请输入:"
end

if tag.to_i > 0 && tag.to_i < count
	projectTag = tag.to_i;
end

# Start Build
path = projects[projectTag]["path"]
system "bundle update"
shell = "cd #{path} && bundle exec fastlane #{lane} scheme:#{scheme} out:#{out} project:#{path} fir_token:#{fir_token} matchUrl:'#{matchUrl}' idendifiers:'#{idendifiers}'"
puts "\033[31m☞准备执行:" + shell + "\033[0m"
puts "☞\n"
system shell