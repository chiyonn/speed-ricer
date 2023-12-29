if [ -f /etc/os-release ] && grep -q '^ID="arch"' /etc/os-release; then
	sudo pacman -S fcitx5-im fcitx5-mozc
	echo 'GTK_IM_MODULE="fcitx5"' | sudo tee -a /etc/profile
	echo 'QT_IM_MODULE="fcitx5"' | sudo tee -a /etc/profile
	echo "XMODIFIERS='@im=fcitx5'" | sudo tee -a /etc/profile

elif grep -q '^ID="ubuntu"' /etc/os-release; then
	sudo add-apt-repository ppa:ikuya-fruitsbasket/fcitx5
	sudo apt upgrade
	sudo apt install fcitx5-mozc
	im-config -n fcitx5
	echo 'GTK_IM_MODULE="fcitx5"' | sudo tee -a /etc/profile
	echo 'QT_IM_MODULE="fcitx5"' | sudo tee -a /etc/profile
	echo "XMODIFIERS='@im=fcitx5'" | sudo tee -a /etc/profile

else
	echo "This OS has no script for install Fcitx5 yet."
fi
