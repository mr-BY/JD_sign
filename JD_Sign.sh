# !/bin/bash

while true; do
	cat <<MRBY
####################
  [1] 安装脚本
  [2] 更新脚本
  [3] 更新Cookie
  [4] 签到
  [5] 退出
####################
MRBY
	read -p "输入选项：" num
	case $num in
	1)
		cd
		apt update && apt upgrade
		termux-setup-storage
		apt install nodejs && npm install request
		;&
	2)
		cd
		wget -O JD_DailyBonus.js https://raw.githubusercontent.com/NobyDa/Script/master/JD-DailyBonus/JD_DailyBonus.js
		;&
	3)
		if [ $num -ne 2 ]; then
			cd
			read -p "输入 账号一 Cookie:"$'\n'"" cookie1
			read -p "输入 账号二 Cookie (如需双账号签到,在此填写,否则留空回车即可):"$'\n'"" cookie2
			sed -i "18c var Key = '$cookie1'; //单引号内自行填写您抓取的Cookie" JD_DailyBonus.js
			sed -i "20c var DualKey = '$cookie2'; //如需双账号签到,此处单引号内填写抓取的"账号2"Cookie, 否则请勿填写" JD_DailyBonus.js
		fi
		;;
	4)
		cd
		node JD_DailyBonus.js
		;;
	5)
		exit 0
		;;
	*)
		echo "No"
		;;
	esac
done
