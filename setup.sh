#!/bin/bash

echo "========================"
echo "install package"
echo "========================"

sudo apt -qq update > /dev/null
sudo apt -qq install -y fluxbox firefox chromium-browser xfce4-terminal thunar mousepad nano curl wget ssh git hsetroot xarchiver build-essential gdebi lxappearance tigervnc-standalone-server tigervnc-xorg-extension > /dev/null
sudo apt -qq install x11-apps x11-common x11-session-utils x11-utils x11-xserver-utils x11-xkb-utils dbus-user-session dbus-x11 libpam0g libxt6 libxext6 > /dev/null
cp -R ./resource/.fluxbox $HOME

# vnc
echo "========================"
echo "install vnc"
echo "========================"

# wget -q https://phoenixnap.dl.sourceforge.net/project/turbovnc/2.2.5/turbovnc_2.2.5_amd64.deb
# sudo dpkg -i turbovnc_2.2.5_amd64.deb > /dev/null

# export PATH=$PATH:/opt/TurboVNC/bin
mkdir $HOME/.vnc
cp ./resource/xstartup $HOME/.vnc/xstartup
sudo chmod +x $HOME/.vnc/xstartup
echo $VNC_PASSWORD | vncpasswd -f > $HOME/.vnc/passwd
chmod 0600 $HOME/.vnc/passwd

vncserver :1 -geometry 1280x768 -rfbport 7582
# /opt/TurboVNC/bin/vncserver :1 -geometry 1280x768 -depth 16 -rfbport 7582

hsetroot -cover $HOME/.fluxbox/background.png

echo "========================"
echo "log vnc"
echo "========================"

cat $HOME/.vnc/*.log

# ngrok
echo "========================"
echo "install ngrok"
echo "========================"

wget -q https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
./ngrok authtoken $NGROK_TOKEN
./ngrok tcp -region=ap 7582 &

echo "========================"
echo "install software"
echo "========================"

sudo snap install code --classic

exit
