#!/bin/bash

start (){
sudo pacman -S dialog git base-devel --needed --noconfirm
menu
}

menu (){
cmd=(dialog --cancel-label "Exit" --title "Menu" --separate-output --checklist "Select options:" 20 70 20)
options=(
1 "whdd" on
2 "hdsentinel " on
3 "hdsentinel_gui" on
4 "spectre-meltdown-checker" on
5 "qmplay2" on
6 "yt-dlp-drop-in" on
7 "youtubedl-gui" on
8 "svp" on
9 "mpv-git" on
10 "libstrangle-git" on
11 "clean" on
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
git clone https://aur.archlinux.org/whdd $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
2)
git clone https://aur.archlinux.org/hdsentinel $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
3)
git clone https://aur.archlinux.org/hdsentinel_gui $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
4)
git clone https://aur.archlinux.org/spectre-meltdown-checker $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
5)
git clone https://aur.archlinux.org/qmplay2 $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
6)
git clone https://aur.archlinux.org/yt-dlp-drop-in $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
7)
git clone https://aur.archlinux.org/youtubedl-gui $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
8)
git clone https://aur.archlinux.org/svp $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
9)
git clone https://aur.archlinux.org/mpv-git $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
10)
git clone https://aur.archlinux.org/libstrangle-git $HOME/aur
cd $HOME/aur; makepkg -src --noconfirm; rm *debug*; mv *zst $HOME; rm -rf $HOME/aur; cd $HOME
;;
11)
yes | sudo pacman -Scc
;;
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

start
