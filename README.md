#This is the website for Nanocon.us, the site for the anual gaming convention hosted by Dakota State University.

#Note, this readme file can also be used as a script to set up everything that is needed to manage the nanocon site from a fresh CentOS install.

#1. su to root and run:
#		echo ' gc  ALL=(ALL) ALL' >> /etc/sudoers
#2. return to normal user
#3. rename this file to setupScript.sh
#4. run the command:
#		chmod +x scritpSetup.sh
#5.	run the script
#6. wait for it to finish. occasionally you may be asked to enter your password if a command has to run with sudo

mkdir Nanocon
cd Nanocon

sudo yum -y install gcc g++ make automake autoconf curl-devel openssl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel eclipse ruby ruby-rdoc ruby-devel rubygems git nodejs postgresql-devel

echo "--------------------- CONFIG GIT --------------------- "
git config --global user.name "charles1024"
git config --global user.email charlesw1024@gmail.com

sudo gem update
sudo gem update --system

echo "--------------------- RVM Setup --------------------- "
echo "#msg: \curl -sSL https://get.rvm.io | bash -s stable --ruby"
\curl -sSL https://get.rvm.io | bash -s stable --ruby
echo "#msg: /home/gc/.rvm/scripts/rvm"
source /home/gc/.rvm/scripts/rvm
echo "#msg: rvm install ruby-2.0.0-p353"
rvm install ruby-2.0.0-p353
echo "#msg: rvm --default use 2.0.0"
rvm --default use 2.0.0

echo "--------------------- Gem Setups --------------------- "
echo "#msg: gem install pg -v '0.15.1'"
sudo gem install pg -v '0.15.1'
echo "#msg: gem install libv8 --version=3.11.8.3"
sudo gem install libv8 -v '3.11.8.3'
echo "#msg: gem install therubyracer -v '0.11.0'"
sudo gem install therubyracer -v '0.11.0'
echo "#msg: gem install execjs"
sudo gem install execjs
echo "#msg: gem install rails"
gem install rails

echo "--------------------- Downloading Sample --------------------- "
git clone https://github.com/charles1024/Nanocon.git
cd Nanocon

echo "--------------------- bundle install --------------------- "
echo "#msg: cp config/database.yml.example config/database.yml"
cp config/database.yml.example config/database.yml

echo "#msg: bundle install"
bundle install
echo "#msg: bundle exec rake db:migrate"
bundle exec rake db:migrate
echo "#msg: bundle exec rake db:test:prepare"
bundle exec rake db:test:prepare
echo "#msg: bundle exec rspec spec/"
bundle exec rspec spec/


#To set up Eclipse:
#0. Run Eclipse as root
#1.	From the Help menu in Eclipse, select Software Updates > Install new software... to open an Install/Update pop-up window.
#2.	On the Install/Update pop-up window, choose the Search for new features to install option, and click the Next button.
#3.	Add a new remote site to add the Aptana plug-in:
#a.	Click the New Remote Site... button to open a New Update Site pop-up window.
#b.	On the New Update Site pop-up window, type Aptana in the site Name text box.
#c.	In the URL text box, type the URL for the Aptana update site: http://download.aptana.com/studio3/plugin/install 
#d.	Click the Finish button to switch to the Updates window.
#4.	On the Updates window, check the Aptana box (shown below), and click the Finish button.
#5.	On the next screen, check the Aptana box, and click the Next button.
#6.	Choose the option to accept the terms of the license agreement, and click the Next button.
#7.	Click the Finish button.
#8.	Click the Install All button. - See more at: http://blog.hulihanapplications.com/browse/view/12-install-aptana-and-radrails-in-eclipse#sthash.nunl2zIf.dpuf
#9.	Open the Eclipse Preferences and look for Install/Update->Available Software and make sure that the Indigo update site is selected.
#10.	If it's not selected, add http://download.eclipse.org/eclipse/updates/3.7 and try to install the Studio again.
#11.	Help > Check for Updates … install all applicable updates

