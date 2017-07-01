# Project Choose ========================================

puts "\n\n\n\n\n\n"
puts "\033[31m☞请选择你要编译的项目？\n\033[0m"

# setting ========================================
projects = [{"name"=>"Xilian New","path"=>"/Users/abyss/Desktop/Dev/ZGXLNew/XilianApp"},
			{"name"=>"Xilian Old","path"=>"/Users/abyss/Desktop/Dev/ZGXLOld/囍联IOS"}];

# setting ========================================
for proj in projects
	puts "1.快速发布==>"+proj["name"]
end

puts "\n(如果你想详细配置发布一个AppStore版本,你得详细确认配置)"
puts "*.请输入'release'\n"

tag = gets.chomp

# Project Choose ========================================

# Deel 

projectTag = 0
while (tag != "1" && tag != "2" && tag != "release")
	if tag == "1" then projectTag = 0
	elsif tag == "2" then puts projectTag = 1
	elsif tag == "release" then puts projectTag = 999
	end
end

# Start Build

if tag == 999
	then puts "gogogogo"
else
	path = projects[projectTag]["path"]
end

# Make Shell
shell = "sh #{path}/build.sh #{path}"

puts "\033[31m☞准备执行:" + shell + "\033[0m"
puts "☞\n"
system shell 


