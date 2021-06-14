#!/bin/bash

# sudo apt update
# sudo apt install -y fluxbox firefox chromium-browser xfce4-terminal thunar mousepad nano curl wget ssh git hsetroot xarchiver build-essential gdebi lxappearance htop x11-apps x11-common x11-session-utils x11-utils x11-xserver-utils x11-xkb-utils dbus-user-session dbus-x11 libpam0g libxt6 libxext6
# cp -R .resource/.fluxbox $HOME

# vnc
# wget https://phoenixnap.dl.sourceforge.net/project/turbovnc/2.2.5/turbovnc_2.2.5_amd64.deb
# sudo dpkg -i turbovnc_2.2.5_amd64.deb

# export PATH=$PATH:/opt/TurboVNC/bin
# mkdir $HOME/.vnc
# cp .resource/xstartup $HOME/.vnc/xstartup.turbovnc
# echo $VNC_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
# chmod 0600 $HOME/.vnc/passwd

# ngrok
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
./ngrok authtoken $NGROK_TOKEN
./ngrok tcp -region=ap 5901
exit
