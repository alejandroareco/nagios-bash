#!/bin/bash

plugins () {

source pathplugins.sh
source cd.sh
source rmplugins.sh

wget https://nagios-plugins.org/download/nagios-plugins-2.3.3.tar.gz

sudo apt install -y gcc make libssl-dev

tar xf nagios-plugins-2.3.3.tar.gz

pluginspath

#cd nagios-plugins-2.3.3/

./configure

make

sudo make install

changedir

#cd ..

rmplugins

#rm -rf nagios-plugins-2.3.3

}
