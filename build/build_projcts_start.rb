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

tag = -1
tag = ARGV[0]; 
lane = ARGV[1];

# 处理逻辑
count = 0
for proj in projects
	puts "#{count.to_int}.==>"+proj["name"]
	count = count + 1
end

projectTag = 0
if tag.to_i >= 0
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

system "export TERM=xterm-256color"
system "export LANG=en_US.UTF-8"
system "LANG=en_US.UTF-8"
system "export LANGUAGE=en_US.UTF-8"
system "LANGUAGE=en_US.UTF-8"
system "export LC_ALL=en_US.UTF-8"
system "LC_ALL=en_US.UTF-8"
shell = "cd #{path} && bundle update && bundle exec fastlane #{lane}"
puts "\033[31m☞准备执行:" + shell + "\033[0m"
puts "☞\n"
system shell