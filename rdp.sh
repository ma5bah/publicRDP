#! /bin/bash
printf "setup loading" >&2
{
sudo useradd -m nerd
sudo usermod -aG sudo nerd
echo 'nerd:8426' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
echo "Passed"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo apt -y install obs-studio
sudo apt -y install firefox
sudo apt -y install qbittorrent
sudo apt install nload
sudo usermod -a -G admin nerd
sudo adduser nerd chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Completed " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - nerd -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n'
printf 'Your SUDO Pasword Is 8426 \n'
