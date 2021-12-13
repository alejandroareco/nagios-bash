#!/bin/bash

install () {

source pathinstall.sh
source cd.sh
source remove.sh

	
wget https://github.com/NagiosEnterprises/nagioscore/releases/download/nagios-4.4.6/nagios-4.4.6.tar.gz

sudo apt install -y unzip

tar xf nagios-4.4.6.tar.gz

pathinstall

#cd nagios-4.4.6/

./configure

make all

sudo make install-groups-users install install-webconf install-config install-init install-daemoninit install-commandmode

#cd ..

changedir

remove

#rm -rf nagios-4.4.6

echo "ingrese contraseña de usuario administrador de Nagios"

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

sudo systemctl start nagios

#systemctl status nagios

#echo "presione 'ENTER' para continuar"

sudo a2enmod cgi

sudo systemctl restart apache2

apt install default-mysql-server php libapache2-mod-php php-mysql

sudo systemctl restart apache2

}

