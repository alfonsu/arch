#!/bin/bash

cmd=(dialog --cancel-label "Exit" --title "Setup Plasma Pure" --separate-output --checklist "Select options:" 41 112 35)
options=(
1 "System Settings - Swich to Icon View" on
2 "System Settings - Apperance - Window Decoration - Titlebar Buttons - Disable Context help" on
3 "System Settings - Apperance - Disable Splash Screen" on
4 "System Settings - Workpace Behavioor - General Behavior - Animation Speed +1" on
5 "System Settings - Workpace Behavioor - General Behavior - Open Files With Duble Click" on
6 "System Settings - Workpace Behavioor - Disable Screen Locking After 5min" on
7 "System Settings - Workpace Behavioor - Disable Screen Locking After Waking From Sleep" on
8 "System Settings - Shortcuts - Add Konsole to Open With Ctrl+Alt+T" on
9 "System Settings - Shortcuts - KWin - Suspend Compositing - Change Default Shortcut to Ctrl+Alt+E " on
10 "System Settings - Startup and Shutdown - Desktop Session - Start with an empty session " on
11 "System Settings - Inpute Devices - Keyboard - Enable Numlock on Plasma Startup" on
12 "System Settings - Inpute Devices - Keyboard - Loyauts - Enable Configure Loyauts" on
13 "System Settings - Inpute Devices - Keyboard - Loyauts - Add Bulgarian Traditional Phonetic" on
14 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Configure keyboard options" on
15 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Key sequence to kill the X server" on
16 "System Settings - Inpute Devices - Keyboard - Advanced - Enable Switching to another layout" on
17 "Dolphin - Change to Details view mode" on
18 "Dolphin - Change Details view mode zoom to 32 pixels" on
19 "Dolphin - Configure - General - Behavior - Remember display style for each folder" on
20 "Dolphin - Configure - Startup - Show on startup /home/" on
21 "Dolphin - Configure - Startup - Show full path inside location bar" on
22 "Dolphin - Configure - Context Menu - Disable Link files to Activities" on
23 "Dolphin - Configure - Context Menu - Disable Tags" on
24 "Enable Fstrim (for SSD optimization)" off
25 "Disable Spectre and Meltdown" off
26 "Enable Grub Last Choice (Not Work for Btrfs)" off
27 "Enable Vimix Grub Theme" off
28 "Install Nohang - correctly prevent out of memory" off
29 "Install and Enable Zram-Generator" off
30 "Install Ananicy - manage processes IO and CPU priorities" off
31 "Install and Enable Printer and Scanner Support" off
32 "Auto Mount All NTFS Partitions to fstab" off
33 "Install Latest Zen Kernel and Headers" off
34 "Update Grub" off
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
clear
for choice in $choices
do
case $choice in
1)
if [ "$(grep "\[Main\]" $HOME/.config/systemsettingsrc)" == "[Main]" ] ; then
    sed -i '/ActiveView=/d' $HOME/.config/systemsettingsrc
else
    echo >> $HOME/.config/systemsettingsrc
    echo "[Main]" >> $HOME/.config/systemsettingsrc
fi
sed -i '/\[Main\]/a\ActiveView=systemsettings_icon_mode' $HOME/.config/systemsettingsrc
;;
2)
if [ "$(grep "\[org.kde.kdecoration2\]" $HOME/.config/kwinrc)" == "[org.kde.kdecoration2]" ] ; then
    sed -i '/ButtonsOnRight=/d' $HOME/.config/kwinrc
else
    echo >> $HOME/.config/kwinrc
    echo "[org.kde.kdecoration2]" >> $HOME/.config/kwinrc
fi
sed -i '/\[org.kde.kdecoration2\]/a\ButtonsOnRight=IAX' $HOME/.config/kwinrc
;;
3)
rm -f $HOME/.config/ksplashrc
echo [KSplash] >> $HOME/.config/ksplashrc
echo Engine=none >> $HOME/.config/ksplashrc
echo Theme=None >> $HOME/.config/ksplashrc
;;
4)
if [ "$(grep "\[KDE\]" $HOME/.config/kdeglobals)" == "[KDE]" ] ; then
    sed -i '/AnimationDurationFactor=/d' $HOME/.config/kdeglobals
else
    echo >> $HOME/.config/kdeglobals
    echo "[KDE]" >> $HOME/.config/kdeglobals
fi
sed -i '/\[KDE\]/a\AnimationDurationFactor=0.7071067811865475' $HOME/.config/kdeglobals
;;
5)
if [ "$(grep "\[KDE\]" $HOME/.config/kdeglobals)" == "[KDE]" ] ; then
    sed -i '/SingleClick=/d' $HOME/.config/kdeglobals
else
    echo >> $HOME/.config/kdeglobals
    echo "[KDE]" >> $HOME/.config/kdeglobals
fi
sed -i '/\[KDE\]/a\SingleClick=false' $HOME/.config/kdeglobals
;;
6)
if [ "$(grep "\[Daemon\]" $HOME/.config/kscreenlockerrc)" == "[Daemon]" ] ; then
    sed -i '/Autolock=/d' $HOME/.config/kscreenlockerrc
else
    echo >> $HOME/.config/kscreenlockerrc
    echo "[Daemon]" >> $HOME/.config/kscreenlockerrc
fi
sed -i '/\[Daemon\]/a\Autolock=false' $HOME/.config/kscreenlockerrc
;;
7)
if [ "$(grep "\[Daemon\]" $HOME/.config/kscreenlockerrc)" == "[Daemon]" ] ; then
    sed -i '/LockOnResume=/d' $HOME/.config/kscreenlockerrc
else
    echo >> $HOME/.config/kscreenlockerrc
    echo "[Daemon]" >> $HOME/.config/kscreenlockerrc
fi
sed -i '/\[Daemon\]/a\LockOnResume=false' $HOME/.config/kscreenlockerrc
;;
8)
if [ "$(grep "\[org.kde.konsole.desktop\]" $HOME/.config/kglobalshortcutsrc)" == "[org.kde.konsole.desktop]" ] ; then
    sed -i '/Konsole/d' $HOME/.config/kglobalshortcutsrc
    sed -i '/NewWindow=/d' $HOME/.config/kglobalshortcutsrc
    sed -i '/NewTab=/d' $HOME/.config/kglobalshortcutsrc
else
    echo >> $HOME/.config/kglobalshortcutsrc
    echo "[org.kde.konsole.desktop]" >> $HOME/.config/kglobalshortcutsrc
fi
sed -i '/\[org.kde.konsole.desktop\]/a\_launch=Ctrl+Alt+T,Ctrl+Alt+T,Konsole' $HOME/.config/kglobalshortcutsrc
sed -i '/\[org.kde.konsole.desktop\]/a\_k_friendly_name=Konsole' $HOME/.config/kglobalshortcutsrc
sed -i '/\[org.kde.konsole.desktop\]/a\NewWindow=none,none,Open a New Window' $HOME/.config/kglobalshortcutsrc
sed -i '/\[org.kde.konsole.desktop\]/a\NewTab=none,none,Open a New Tab' $HOME/.config/kglobalshortcutsrc
;;
9)
sed -i '/Suspend Compositing=/c\Suspend Compositing=Ctrl+Alt+E,Alt+Shift+F12,Suspend Compositing' $HOME/.config/kglobalshortcutsrc
;;
10)
if [ "$(grep "\[General\]" $HOME/.config/ksmserverrc)" == "[General]" ] ; then
    sed -i '/loginMode=/d' $HOME/.config/ksmserverrc
else
    echo >> $HOME/.config/ksmserverrc
    echo "[General]" >> $HOME/.config/ksmserverrc
fi
sed -i '/\[General\]/a\loginMode=emptySession' $HOME/.config/ksmserverrc
;;
11)
if [ "$(grep "\[Keyboard\]" $HOME/.config/kcminputrc)" == "[Keyboard]" ] ; then
    sed -i '/NumLock=/d' $HOME/.config/kcminputrc
else
    echo >> $HOME/.config/kcminputrc
    echo "[Keyboard]" >> $HOME/.config/kcminputrc
fi
sed -i '/\[Keyboard\]/a\NumLock=0' $HOME/.config/kcminputrc
;;
12)
if [ "$(grep "\[Layout\]" $HOME/.config/kxkbrc)" == "[Layout]" ] ; then
    sed -i '/LayoutList=/d' $HOME/.config/kxkbrc
    sed -i '/Use=/d' $HOME/.config/kxkbrc
else
    echo >> $HOME/.config/kxkbrc
    echo "[Layout]" >> $HOME/.config/kxkbrc
fi
sed -i '/\[Layout\]/a\Use=true' $HOME/.config/kxkbrc
sed -i '/\[Layout\]/a\LayoutList=us' $HOME/.config/kxkbrc
;;
13)
if [ "$(grep "\[Layout\]" $HOME/.config/kxkbrc)" == "[Layout]" ] ; then
    sed -i '/DisplayNames=/d' $HOME/.config/kxkbrc
    sed -i '/VariantList=/d' $HOME/.config/kxkbrc
    sed -i '/LayoutList=/d' $HOME/.config/kxkbrc
else
    echo >> $HOME/.config/kxkbrc
    echo "[Layout]" >> $HOME/.config/kxkbrc
fi
sed -i '/\[Layout\]/a\VariantList=,phonetic' $HOME/.config/kxkbrc
sed -i '/\[Layout\]/a\DisplayNames=,' $HOME/.config/kxkbrc
sed -i '/\[Layout\]/a\LayoutList=us,bg' $HOME/.config/kxkbrc
;;
14)
if [ "$(grep "\[Layout\]" $HOME/.config/kxkbrc)" == "[Layout]" ] ; then
    sed -i '/ResetOldOptions=/d' $HOME/.config/kxkbrc
else
    echo >> $HOME/.config/kxkbrc
    echo "[Layout]" >> $HOME/.config/kxkbrc
fi
sed -i '/\[Layout\]/a\ResetOldOptions=true' $HOME/.config/kxkbrc
;;
15)
if [ "$(grep "\[Layout\]" $HOME/.config/kxkbrc)" == "[Layout]" ] ; then
    sed -i '/^Options=/d' $HOME/.config/kxkbrc
else
    echo >> $HOME/.config/kxkbrc
    echo "[Layout]" >> $HOME/.config/kxkbrc
fi
sed -i '/\[Layout\]/a\Options=,terminate:ctrl_alt_bksp' $HOME/.config/kxkbrc
;;
16)
if [ "$(grep "\[Layout\]" $HOME/.config/kxkbrc)" == "[Layout]" ] ; then
    sed -i '/^Options=/d' $HOME/.config/kxkbrc
else
    echo >> $HOME/.config/kxkbrc
    echo "[Layout]" >> $HOME/.config/kxkbrc
fi
sed -i '/\[Layout\]/a\Options=,terminate:ctrl_alt_bksp,grp:alt_shift_toggle' $HOME/.config/kxkbrc
;;
17)
if [ "$(grep "\[Dolphin\]" $HOME/.local/share/dolphin/view_properties/global/.directory)" == "[Dolphin]" ] ; then
    sed -i '/ViewMode=/d' $HOME/.local/share/dolphin/view_properties/global/.directory
else
    echo >> $HOME/.local/share/dolphin/view_properties/global/.directory
    echo "[Dolphin]" >> $HOME/.local/share/dolphin/view_properties/global/.directory
fi
sed -i '/\[Dolphin\]/a\ViewMode=1' $HOME/.local/share/dolphin/view_properties/global/.directory
;;
18)
if [ "$(grep "\[DetailsMode\]" $HOME/.config/dolphinrc)" == "[DetailsMode]" ] ; then
    sed -i '/PreviewSize=/d' $HOME/.config/dolphinrc
else
    echo >> $HOME/.config/dolphinrc
    echo "[DetailsMode]" >> $HOME/.config/dolphinrc
fi
sed -i '/\[DetailsMode\]/a\PreviewSize=32' $HOME/.config/dolphinrc
;;
19)
if [ "$(grep "\[General\]" $HOME/.config/dolphinrc)" == "[General]" ] ; then
    sed -i '/GlobalViewProps=/d' $HOME/.config/dolphinrc
else
    echo >> $HOME/.config/dolphinrc
    echo "[General]" >> $HOME/.config/dolphinrc
fi
sed -i '/\[General\]/a\GlobalViewProps=false' $HOME/.config/dolphinrc
;;
20)
if [ "$(grep "\[General\]" $HOME/.config/dolphinrc)" == "[General]" ] ; then
    sed -i '/RememberOpenedTabs=/d' $HOME/.config/dolphinrc
else
    echo >> $HOME/.config/dolphinrc
    echo "[General]" >> $HOME/.config/dolphinrc
fi
sed -i '/\[General\]/a\RememberOpenedTabs=false' $HOME/.config/dolphinrc
;;
21)
if [ "$(grep "\[General\]" $HOME/.config/dolphinrc)" == "[General]" ] ; then
    sed -i '/ShowFullPath=/d' $HOME/.config/dolphinrc
else
    echo >> $HOME/.config/dolphinrc
    echo "[General]" >> $HOME/.config/dolphinrc
fi
sed -i '/\[General\]/a\ShowFullPath=true' $HOME/.config/dolphinrc
;;
22)
if [ "$(grep "\[Show\]" $HOME/.config/kservicemenurc)" == "[Show]" ] ; then
    sed -i '/kactivitymanagerd_fileitem_linking_plugin=/d' $HOME/.config/kservicemenurc
else
    echo >> $HOME/.config/kservicemenurc
    echo "[Show]" >> $HOME/.config/kservicemenurc
fi
sed -i '/\[Show\]/a\kactivitymanagerd_fileitem_linking_plugin=false' $HOME/.config/kservicemenurc
;;
23)
if [ "$(grep "\[Show\]" $HOME/.config/kservicemenurc)" == "[Show]" ] ; then
    sed -i '/tagsfileitemaction=/d' $HOME/.config/kservicemenurc
else
    echo >> $HOME/.config/kservicemenurc
    echo "[Show]" >> $HOME/.config/kservicemenurc
fi
sed -i '/\[Show\]/a\tagsfileitemaction=false' $HOME/.config/kservicemenurc
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
*)
echo "----"
echo "Done"
echo "----"
exit ;;
esac
