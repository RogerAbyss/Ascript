echo -e '\033[32m 　　　＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿
彡　 _／ ⌒ ⌒ 
　　/)) (●) (●) 　ヽ	 	what are u saying?
　 ｜∩　(_人_)　 |     	 	\033[0m\033[31m☞it`s Ascipt!\033[0m\033[32m
　 / ノ､＿ヽノ＿ノ￣) 		I`m Abyss!
　/ /　　　　　 /ﾌ_/ 
　L＿／＼　　　 ＼(	＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿\033[0m'

echo -e '\n\033[31m清理Xcode垃圾\033[0m'
cd /Users/abyss/Library/Developer/Xcode/DerivedData&&rm -rf *\
&&cd /Users/abyss/Library/Developer/Xcode/Archives&&rm -rf *
echo -e '\n\033[31m清理Mac睡眠启动虚拟存储\033[0m'
echo -e '\033[32m需要输入个人密码:\033[0m'
cd /private/var/vm &&sudo rm -rf *
echo -e '\033[32mClean Done!\033[0m'