#This script should mostly set up my current Ubuntu 16.04 desktop environment
sudo apt-get update

echo What email address to use for git and ssh key?

read email

#Add repositories
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/'
sudo add-apt-repository ppa:apandada1/brightness-controller
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository ppa:marutter/rrutter

sudo apt-get update

#Get terminator for terminals
sudo apt-get install terminator 

#Get brightness controller for multiple monitors
sudo apt-get install brightness-controller-simple

#Get xclip - allows to output from bash to clipboard
sudo apt-get install xclip
#e.g xclip -sel clip < ~/.ssh/id_rsa.pub

#Get window resizing thing
sudo apt-get install compizconfig-settings-manager

#Hide the welcome noise file
sudo mv ~/usr/share/sounds/ubuntu/stereo/system-ready.ogg ~/usr/share/sounds/ubuntu/stereo/hiddensystem-ready.ogg

#Bluetooth disabled as default
sudo systemctl disable bluetooth.service

#Install vim
sudo apt-get install vim

#Install chrome
sudo apt-get install google-chrome-stable

#Install Sublime text
sudo apt-get install sublime-text

#Install R
sudo apt-get install r-base
sudo apt-get install r-base-dev

#Install and configure git
sudo apt-get install git
git config --global user.email $email 
git config --global user.name Ian


#Set keyboard layout to US standard
setxkbmap us

#Create ssh keys
ssh-keygen -t rsa -C $email

#System preferences
gsettings set com.canonical.indicator.power show-percentage true

