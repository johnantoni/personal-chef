
#TODO: Use oracle java 7 instead of OpenJDK 6
#TODO: install my personal dotfiles
#TODO: perhaps my SSH settings? look into data bags perhaps?
#TODO: jruby and 1.9.3 are not installing (no idea about rbx)

Packages = %w(
   amarok ffmpeg google-chrome-stable google-musicmanager-beta gimp graphviz
   grive heroku-toolbelt htop imagemagick inkscape iotop memcached mongodb 
   mysql-server nginx openssh-server postgresql-9.1 postgresql-contrib-9.1 
   skype steam sublime-text terminator virtualbox vlc wine1.5
)

apt_repository "google-chrome" do
   uri "http://dl.google.com/linux/deb/"
   distribution "stable"
   components ["main"]
   key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
end

apt_repository "google-music-manager" do
   uri "http://dl.google.com/linux/musicmanager/deb/"
   distribution "stable"
   components ["main"]
   key "https://dl-ssl.google.com/linux/linux_signing_key.pub"
end

apt_repository "heroku-toolbelt" do
   uri "http://toolbelt.heroku.com/ubuntu"
   distribution './'
   key "https://toolbelt.heroku.com/apt/release.key"
end

apt_repository "steam" do
   uri "http://repo.steampowered.com/steam/"
   distribution "precise"
   components ["steam"]
   keyserver "keyserver.ubuntu.com"
   key "B05498B7"
end

apt_repository "ppa:webupd8team/sublime-text-2" do
   uri "http://ppa.launchpad.net/webupd8team/sublime-text-2/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "EEA14886"
end

apt_repository "ppa:nginx/stable" do
   uri "http://ppa.launchpad.net/nginx/stable/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "C300EE8C"
end

# includes, among other things, Amarok
apt_repository "ppa:kubuntu-ppa/backports" do
   uri "http://ppa.launchpad.net/kubuntu-ppa/backports/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "8AC93F7A"
end

apt_repository "ppa:john-severinsson/ffmpeg" do
   uri "http://ppa.launchpad.net/jon-severinsson/ffmpeg/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "CFCA9579"
end

apt_repository "ppa:otto-kesselgulasch/gimp" do
   uri "http://ppa.launchpad.net/otto-kesselgulasch/gimp/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "614C4B38"
end

# includes, among other things, Grive
apt_repository "ppa:nilarimogard/webupd8" do
   uri "http://ppa.launchpad.net/nilarimogard/webupd8/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "4C9D234C"
end

apt_repository "ppa:debfx/virtualbox" do
   uri "http://ppa.launchpad.net/debfx/virtualbox/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "62F1201A"
end

apt_repository "ppa:ubuntu-wine/ppa" do
   uri "http://ppa.launchpad.net/ubuntu-wine/ppa/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "F9CB8DB0"
end

# includes, among other things Skype
apt_repository "ppa:upubuntu-com/chat" do
   uri "http://ppa.launchpad.net/upubuntu-com/chat/ubuntu"
   distribution node['lsb']['codename']
   components ["main"]
   keyserver "keyserver.ubuntu.com"
   key "E06E6293"
end

Packages.each do |package_name|
   package(package_name) { action :install }
end