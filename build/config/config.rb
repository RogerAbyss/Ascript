module Abyss
	module Build
		module Config

			# match git 地址
			MATCH_GIT = "git@git.oschina.net:abyssroger/ppmatch.git"

			# App Idendifier集合
			Idendifiers = ["com.XilianApp.zgxl","com.zgxl.app","com.zgxl.xiyipo","com.zgxl.xiyipoCQ"]

			# 工程目录
			# name => 显示的名字
			# path => 工程路径
			# scheme => scheme
			PROJECTS = 
			[{"name"=>"Xilian New","path"=>"/Users/abyss/Desktop/Dev/ZGXLNew/XilianApp","scheme"=>"XilianApp"},
			{"name"=>"Xilian Old","path"=>"/Users/abyss/Desktop/Dev/ZGXLOld/囍联IOS","scheme"=>"testappdomain"},];
			
			# 输出路径
			OUTPUT_PATH = "/Users/abyss/Desktop/outputs/#{Time.now.strftime('%m%d')}"

			# 发送邮箱
			EMAIL_SENDER = "roger_ren@qq.com"

			EMAIL_CC	 = ["845450492@qq.com",
							"51568488@qq.com","15922883743@163.com","610447442@qq.com","349470694@qq.com",
							# "huangxing_email@sina.com","1918130@qq.com",
						]
			# 邮件内容
			EMAIL_CONTENT = "
			☞此页面提供更多帮助: 
			https://git.oschina.net/abyssroger/dotsets/tree/master/AbyssFramework/EmailNotification

			☞更新内容: 

			☞以下为近期十条提交记录:

			"
		end
	end
end