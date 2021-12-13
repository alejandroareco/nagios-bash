#!/bin/bash

bkp () {

# respaldo de nagios log

#DIR=$HOME

DATE=$(date +%d-%m-%Y-%H%M%S)
BACKUP_DIR=/home/alejandro/final-programacion
SOURCE=/usr/local/nagios/var/nagios.log

tar -cvzpf $BACKUP_DIR/nagios-log-BKP-$DATE.tar.gz $SOURCE

}
