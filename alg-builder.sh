#!/bin/bash

start (){
sudo pacman -S dialog git archiso --needed --noconfirm
menu
}

menu (){
cmd=(dialog --cancel-label "Exit" --title "Menu" --menu "Select options:" 19 65 12 )
options=(
1 "ALG Builds Untouched"
2 "ALG Builds Zstandard"
3 "Clean Package Cache"
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
alg-untouched
;;
2)
alg-zstd
;;
3)
yes | sudo pacman -Scc
esac
done
case "$ret" in
*)
echo "----"
echo "Done"
echo "----"
exit
;;
esac
}

alg-untouched (){
cmd=(dialog --cancel-label "Back" --title "ALG Builds Untouched" --separate-output --checklist "Select options:" 19 65 12)
options=(
1 "Add [alg_repo] to /etc/pacman.conf (if missing)" off
2 "Add [alg-settings] to /etc/pacman.conf (if missing)" off
3 "Add [chaotic-aur] to /etc/pacman.conf (if missing)" off
4 "Build arch-linux-gui-plasma" off
5 "Build archlinux-gui-gnome" off
6 "Build archlinux-gui-xfce" off
7 "Build archlinux-gui-cinnamon" off
8 "Build archlinux-gui-plasma-pure" off
9 "Build archlinux-gui-gnome-pure" off
10 "Build archlinux-gui-xfce-pure" off
11 "Build archlinux-gui-i3" off
12 "Build archlinux-gui-zen" off
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [alg_repo] >> /etc/pacman.conf'
sudo sh -c 'echo SigLevel = Optional TrustedOnly >> /etc/pacman.conf'
sudo sh -c 'echo Server = https://arch-linux-gui.github.io/\$repo/\$arch >> /etc/pacman.conf'
;;
2)
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [alg-settings] >> /etc/pacman.conf'
sudo sh -c 'echo SigLevel = Optional TrustedOnly >> /etc/pacman.conf'
sudo sh -c 'echo Server = https://arch-linux-gui.github.io/\$repo/\$arch >> /etc/pacman.conf'
;;
3)
sudo pacman -Syy
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [chaotic-aur] >> /etc/pacman.conf'
sudo sh -c 'echo Include = /etc/pacman.d/chaotic-mirrorlist >> /etc/pacman.conf'
sudo sh -c 'echo >> /etc/pacman.conf'
;;
4)
git clone https://github.com/arch-linux-gui/arch-linux-gui-plasma $HOME/arch-linux-gui-plasma/
cd $HOME/arch-linux-gui-plasma/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-plasma/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-plasma/
cd $HOME
;;
5)
git clone https://github.com/arch-linux-gui/arch-linux-gui-gnome $HOME/arch-linux-gui-gnome/
cd $HOME/arch-linux-gui-gnome/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-gnome/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-gnome/
cd $HOME
;;
6)
git clone https://github.com/arch-linux-gui/arch-linux-gui-xfce $HOME/arch-linux-gui-xfce/
cd $HOME/arch-linux-gui-xfce/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-xfce/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-xfce/
cd $HOME
;;
7)
git clone https://github.com/arch-linux-gui/arch-linux-gui-cinnamon $HOME/arch-linux-gui-cinnamon/
cd $HOME/arch-linux-gui-cinnamon/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-cinnamon/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-cinnamon/
cd $HOME
;;
8)
git clone https://github.com/arch-linux-gui/alg-plasma-pure $HOME/alg-plasma-pure/
cd $HOME/alg-plasma-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
echo kwalletmanager >> packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-plasma-pure/out/* $HOME
sudo rm -r $HOME/alg-plasma-pure/
cd $HOME
;;
9)
git clone https://github.com/arch-linux-gui/alg-gnome-pure $HOME/alg-gnome-pure/
cd $HOME/alg-gnome-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-gnome-pure/out/* $HOME
sudo rm -r $HOME/alg-gnome-pure/
cd $HOME
;;
10)
git clone https://github.com/arch-linux-gui/alg-xfce-pure $HOME/alg-xfce-pure/
cd $HOME/alg-xfce-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-xfce-pure/out/* $HOME
sudo rm -r $HOME/alg-xfce-pure/
cd $HOME
;;
11)
git clone https://github.com/arch-linux-gui/alg-i3 $HOME/alg-i3/
cd $HOME/alg-i3/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-i3/out/* $HOME
sudo rm -r $HOME/alg-i3/
cd $HOME
;;
12)
git clone https://github.com/arch-linux-gui/arch-linux-gui-zen $HOME/arch-linux-gui-zen/
cd $HOME/arch-linux-gui-zen/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-zen/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-zen/
cd $HOME
;;
esac
done
case "$ret" in
*) menu ;;
esac
}

alg-zstd (){
cmd=(dialog --cancel-label "Back" --title "ALG Builds Zstandard" --separate-output --checklist "Select options:" 19 65 12)
options=(
1 "Add [alg_repo] to /etc/pacman.conf (if missing)" off
2 "Add [alg-settings] to /etc/pacman.conf (if missing)" off
3 "Add [chaotic-aur] to /etc/pacman.conf (if missing)" off
4 "Build arch-linux-gui-plasma" off
5 "Build archlinux-gui-gnome" off
6 "Build archlinux-gui-xfce" off
7 "Build archlinux-gui-cinnamon" off
8 "Build archlinux-gui-plasma-pure" off
9 "Build archlinux-gui-gnome-pure" off
10 "Build archlinux-gui-xfce-pure" off
11 "Build archlinux-gui-i3" off
12 "Build archlinux-gui-zen" off
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [alg_repo] >> /etc/pacman.conf'
sudo sh -c 'echo SigLevel = Optional TrustedOnly >> /etc/pacman.conf'
sudo sh -c 'echo Server = https://arch-linux-gui.github.io/\$repo/\$arch >> /etc/pacman.conf'
;;
2)
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [alg-settings] >> /etc/pacman.conf'
sudo sh -c 'echo SigLevel = Optional TrustedOnly >> /etc/pacman.conf'
sudo sh -c 'echo Server = https://arch-linux-gui.github.io/\$repo/\$arch >> /etc/pacman.conf'
;;
3)
sudo pacman -Syy
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
sudo sh -c 'echo >> /etc/pacman.conf'
sudo sh -c 'echo [chaotic-aur] >> /etc/pacman.conf'
sudo sh -c 'echo Include = /etc/pacman.d/chaotic-mirrorlist >> /etc/pacman.conf'
sudo sh -c 'echo >> /etc/pacman.conf'
;;
4)
git clone https://github.com/arch-linux-gui/arch-linux-gui-plasma $HOME/arch-linux-gui-plasma/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/arch-linux-gui-plasma/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/arch-linux-gui-plasma/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/arch-linux-gui-plasma/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/arch-linux-gui-plasma/airootfs/etc/mkinitcpio.conf
cd $HOME/arch-linux-gui-plasma/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-plasma/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-plasma/
cd $HOME
;;
5)
git clone https://github.com/arch-linux-gui/arch-linux-gui-gnome $HOME/arch-linux-gui-gnome/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/arch-linux-gui-gnome/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/arch-linux-gui-gnome/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/arch-linux-gui-gnome/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/arch-linux-gui-gnome/airootfs/etc/mkinitcpio.conf
cd $HOME/arch-linux-gui-gnome/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-gnome/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-gnome/
cd $HOME
;;
6)
git clone https://github.com/arch-linux-gui/arch-linux-gui-xfce $HOME/arch-linux-gui-xfce/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/arch-linux-gui-xfce/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/arch-linux-gui-xfce/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/arch-linux-gui-xfce/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/arch-linux-gui-xfce/airootfs/etc/mkinitcpio.conf
cd $HOME/arch-linux-gui-xfce/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-xfce/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-xfce/
cd $HOME
;;
7)
git clone https://github.com/arch-linux-gui/arch-linux-gui-cinnamon $HOME/arch-linux-gui-cinnamon/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/arch-linux-gui-cinnamon//profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/arch-linux-gui-cinnamon//profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/arch-linux-gui-cinnamon//airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/arch-linux-gui-cinnamon//airootfs/etc/mkinitcpio.conf
cd $HOME/arch-linux-gui-cinnamon/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-cinnamon/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-cinnamon/
cd $HOME
;;
8)
git clone https://github.com/arch-linux-gui/alg-plasma-pure $HOME/alg-plasma-pure/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/alg-plasma-pure/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/alg-plasma-pure/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/alg-plasma-pure/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/alg-plasma-pure/airootfs/etc/mkinitcpio.conf
cd $HOME/alg-plasma-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
echo kwalletmanager >> packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-plasma-pure/out/* $HOME
sudo rm -r $HOME/alg-plasma-pure/
cd $HOME
;;
9)
git clone https://github.com/arch-linux-gui/alg-gnome-pure $HOME/alg-gnome-pure/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/alg-gnome-pure/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/alg-gnome-pure/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/alg-gnome-pure/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/alg-gnome-pure/airootfs/etc/mkinitcpio.conf
cd $HOME/alg-gnome-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-gnome-pure/out/* $HOME
sudo rm -r $HOME/alg-gnome-pure/
cd $HOME
;;
10)
git clone https://github.com/arch-linux-gui/alg-xfce-pure $HOME/alg-xfce-pure/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/alg-xfce-pure/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/alg-xfce-pure/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/alg-xfce-pure/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/alg-xfce-pure/airootfs/etc/mkinitcpio.conf
cd $HOME/alg-xfce-pure/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-xfce-pure/out/* $HOME
sudo rm -r $HOME/alg-xfce-pure/
cd $HOME
;;
11)
git clone https://github.com/arch-linux-gui/alg-i3 $HOME/alg-i3/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/alg-i3/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/alg-i3/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/alg-i3/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/alg-i3/airootfs/etc/mkinitcpio.conf
cd $HOME/alg-i3/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/alg-i3/out/* $HOME
sudo rm -r $HOME/alg-i3/
cd $HOME
;;
12)
git clone https://github.com/arch-linux-gui/arch-linux-gui-zen $HOME/arch-linux-gui-zen/
sed -i '/#airootfs_image_tool_options=/c\' $HOME/arch-linux-gui-zen/profiledef.sh
sed -i "/airootfs_image_tool_options=/c\airootfs_image_tool_options=('-comp' 'zstd' '-Xcompression-level' '1' '-b' '1M')" $HOME/arch-linux-gui-zen/profiledef.sh
sed -i '/COMPRESSION="xz"/c\#COMPRESSION="xz"\' $HOME/arch-linux-gui-zen/airootfs/etc/mkinitcpio.conf
sed -i 's/#COMPRESSION="zstd"/COMPRESSION="zstd"/g' $HOME/arch-linux-gui-zen/airootfs/etc/mkinitcpio.conf
cd $HOME/arch-linux-gui-zen/
sed -i '/ipw2100-fw/d' packages.x86_64
sed -i '/ipw2200-fw/d' packages.x86_64
sudo mkarchiso -v .
sudo mv $HOME/arch-linux-gui-zen/out/* $HOME
sudo rm -r $HOME/arch-linux-gui-zen/
cd $HOME
;;
esac
done
case "$ret" in
*) menu ;;
esac
}

start
