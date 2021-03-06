#This script should mostly set up my current Ubuntu 16.04 desktop environment
#Run with:
#sudo bash ubuntu-env-recreate.sh
echo What email address to use for git and ssh key?
read email


echo -----First Update-----
sudo apt-get update 

echo -----Detecting Distro-----
opsys=`uname -r`
if [[ "$opsys" = *"kali"* ]]; then
	opsys="kali"
else
	opsys="ubuntu"
fi

echo Distro seems to be $opsys


echo -----Going to get required repositories-----

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo add-apt-repository ppa:marutter/rrutter
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian `lsb_release -cs` contrib"
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' 
sudo add-apt-repository ppa:apandada1/brightness-controller 
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DABsudo 9 


echo -----Going to install specified software-----
echo $opsys
if [ $opsys == "ubuntu" ]; then
	echo installing apt packages for Ubuntu setup
	sudo apt-get install terminator  \
	brightness-controller-simple \
	xclip \
	vim \
	compizconfig-settings-manager \
	google-chrome-stable \
	sublime-text \
	r-base \
	r-base-dev \
	git \
	virtualbox-5.2 \
	htop \
	mysql-client-core-5.7 \
	python-pip \
	python3-pip
elif [ $opsys == "kali" ]; then
	echo installing apt packages for Kali setup
	apt-get install terminator \
		vim \
		xclip \
		google-chrome-stable \
		sublime-text \
		git \
		htop
else 
	echo unknown distro

fi

sudo apt-get update


echo -----Copy over the .profile file and config files-----
#Uncomment the below line for the first time you run this on a system
#cat aliases.txt >> ~/.bashrc
#TODO for each of the below config files, replace original file and source the file
mkdir ~/.config/terminator
cat configs/terminator/config > ~/.config/terminator/config

echo -----Configuring git and system as specified-----

#Install and configure git
git config --global user.email $email 
git config --global user.name colemai
git config --global push.default simple

sudo systemctl disable bluetooth.service \

#Set keyboard layout to US standard
setxkbmap us

#Create ssh keys
#Uncomment the below line for the first time you run this on a system
#ssh-keygen -t rsa -C $email				

#System preferences
gsettings set com.canonical.indicator.power show-percentage true

#Move the opening sound (desktop load sound)
mv ~/usr/share/sounds/ubuntu/stereo/system-ready.ogg ~/usr/share/sounds/ubuntu/stereo/hiddensystem-ready.ogg 
