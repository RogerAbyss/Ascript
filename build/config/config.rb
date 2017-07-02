module Abyss
	module Build
		module Config
			# 工程目录
			# name => 显示的名字
			# path => 工程路径
			# scheme => scheme
			PROJECTS = 
			[{"name"=>"Xilian New","path"=>"/Users/abyss/Desktop/Dev/ZGXLNew/XilianApp","scheme"=>"XilianApp"},
			{"name"=>"Xilian Old","path"=>"/Users/abyss/Desktop/Dev/ZGXLOld/囍联IOS","scheme"=>"testappdomain"},
			{"name"=>"zgxl","path"=>"/Users/abyss/Desktop/Dev/FastlaneProj","scheme"=>"zgxl"},];
			
			# 输出路径
			OUTPUT_PATH = "/Users/abyss/Desktop/outputs/#{Time.now.strftime('%m%d')}"

			# 发送邮箱
			EMAIL_SENDER = ["roger_ren@qq.com"]
			# 邮件标题
			EMAIL_TITLE = "新版本已经上传!"
			# 邮件内容
			EMAIL_CONTENT = "新版本已经上传!"
		end
	end
end