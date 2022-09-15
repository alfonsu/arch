#!/bin/bash

cmd=(dialog --cancel-label "Back" --title "Setup Plasma Pure" --separate-output --checklist "Select options:" 41 120 35)
options=(
1 "System Settings - Swich to Icon View" on
2 "System Settings - Apperance - Window Decoration - Titlebar Buttons - Disable Context help" on
3 "System Settings - Apperance - Disable Splash Screen" on
4 "System Settings - Workpace Behavioor - General Behavior - Animation Speed +1" on
5 "System Settings - Workpace Behavioor - General Behavior - Open Files With Duble Click" on
6 "System Settings - Workpace Behavioor - Disable Screen Locking After 5min" on
7 "System Settings - Disable Screen Locking After Waking From Sleep" on
8 "System Settings - Shortcuts - Add Konsole to Open With Ctrl+Alt+T" on
9 "System Settings - Shortcuts - KWin - Suspend Compositing - Change Default Shortcut to Ctrl+Alt+E " on
10 "System Settings - Startup and Shutdown - Desktop Session - Start with an empty session " on
11 "System Settings - Inpute Devices - Keyboard - Enable Numlock on Plasma Startup" on
12 "System Settings - Inpute Devices - Keyboard - Loyauts - Enable Configure Loyauts" on
13 "System Settings - Inpute Devices - Keyboard - Loyauts - Add Bulgarian Traditional Phonetic" on
14 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Configure keyboard options" on
15 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Key sequence to kill the X server" on
16 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Switching to another layout" on
17 "Speed up AUR builds" on
18 "Install Youtubedl-GUI" on
19 "Update KDE Configs with Apps" on
20 "Change SDDM Theme to Breeze" on
21 "Add Virtual Keyboard to SDDM" on
22 "Change Swappiness to 10" on
23 "Enable Timesync and Bluetooth Service" on
24 "Enable Fstrim (for SSD optimization)" on
25 "Disable Spectre and Meltdown" on
26 "Enable Grub Last Choice (Not Work for Btrfs)" on
27 "Enable Vimix Grub Theme" on
28 "Install Nohang - correctly prevent out of memory" on
29 "Install and Enable Zram-Generator" on
30 "Install Ananicy - manage processes IO and CPU priorities" on
31 "Install and Enable Printer and Scanner Support" on
32 "Auto Mount All NTFS Partitions to fstab" on
33 "Install Latest Zen Kernel and Headers" on
34 "Update Grub" on
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
echo >> $HOME/.config/systemsettingsrc
echo [Main] >> $HOME/.config/systemsettingsrc
echo ActiveView=systemsettings_icon_mode >> $HOME/.config/systemsettingsrc
;;
2)
echo >> $HOME/.config/kwinrc
echo [org.kde.kdecoration2] >> $HOME/.config/kwinrc
echo ButtonsOnRight=IAX >> $HOME/.config/kwinrc
;;
3)
sed -i '/Engine/c\Engine=none' $HOME/.config/ksplashrc
sed -i '/Theme/c\Theme=None' $HOME/.config/ksplashrc
;;
4)
echo >> $HOME/.config/kdeglobals
echo [KDE] >> $HOME/.config/kdeglobals
echo AnimationDurationFactor=0.7071067811865475 >> $HOME/.config/kdeglobals
;;
5)
echo >> $HOME/.config/kdeglobals
echo [KDE] >> $HOME/.config/kdeglobals
echo SingleClick=false >> $HOME/.config/kdeglobals
;;
6)
echo >> $HOME/.config/kscreenlockerrc
echo [Daemon] >> $HOME/.config/kscreenlockerrc
echo Autolock=false >> $HOME/.config/kscreenlockerrc
;;
7)
echo >> $HOME/.config/kscreenlockerrc
echo [Daemon] >> $HOME/.config/kscreenlockerrc
echo LockOnResume=false >> $HOME/.config/kscreenlockerrc
;;
8)
echo >> $HOME/.config/kglobalshortcutsrc
echo [org.kde.konsole.desktop] >> $HOME/.config/kglobalshortcutsrc
echo NewTab=none,none,Open a New Tab >> $HOME/.config/kglobalshortcutsrc
echo NewWindow=none,none,Open a New Window >> $HOME/.config/kglobalshortcutsrc
echo _k_friendly_name=Konsole >> $HOME/.config/kglobalshortcutsrc
echo _launch=Ctrl+Alt+T,Ctrl+Alt+T,Konsole >> $HOME/.config/kglobalshortcutsrc
;;
9)
sed -i '/Suspend Compositing=/c\Suspend Compositing=Ctrl+Alt+E,Alt+Shift+F12,Suspend Compositing' $HOME/.config/kglobalshortcutsrc
;;
10)
echo >> $HOME/.config/ksmserverrc
echo [General] >> $HOME/.config/ksmserverrc
echo loginMode=emptySession >> $HOME/.config/ksmserverrc
;;
11)
echo >> $HOME/.config/kcminputrc
echo [Keyboard] >> $HOME/.config/kcminputrc
echo NumLock=0 >> $HOME/.config/kcminputrc
;;
12)
echo >> $HOME/.config/kxkbrc
echo [Layout] >> $HOME/.config/kxkbrc
echo Options= >> $HOME/.config/kxkbrc
echo LayoutList=us >> $HOME/.config/kxkbrc
echo Use=true >> $HOME/.config/kxkbrc
;;
13)
echo DisplayNames=, >> $HOME/.config/kxkbrc
echo VariantList=,phonetic >> $HOME/.config/kxkbrc
sed -i 's/us/us,bg/g' $HOME/.config/kxkbrc
;;
14)
echo ResetOldOptions=true >> $HOME/.config/kxkbrc
;;
15)
sed -i '0,/Options=/s//Options=terminate:ctrl_alt_bksp,/' $HOME/.config/kxkbrc
;;
16)
sed -i '0,/Options=/s//Options=grp:alt_shift_toggle,/' $HOME/.config/kxkbrc
;;
17)

;;
18)

;;
19)

;;
20)

;;
21)

;;
22)

;;
23)

;;
24)

;;
25)

;;
26)

;;
27)

;;
28)

;;
29)

;;
30)

;;
31)

;;
32)

;;
33)

;;
34)

;;
esac
done
case "$ret" in
*) exit ;;
esac
