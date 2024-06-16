#!/bin/bash

start (){
sudo pacman -S git base-devel --needed --noconfirm
menu
}

menu (){
read -p "Enter the package name: " PACKAGE_NAME

git clone https://aur.archlinux.org/$PACKAGE_NAME $HOME/aur
cd $HOME/aur
makepkg -sirc --noconfirm
rm *debug*
mv *zst $HOME
rm -rf $HOME/aur
cd $HOME
menu
}

start
