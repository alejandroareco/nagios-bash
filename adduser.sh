#!/bin/bash

#alta de usuario

adduser () {

#/usr/local/nagios/etc

echo "ingrese username a agregar"

read NOMBRE

htpasswd -m /usr/local/nagios/etc/htpasswd.users $NOMBRE

echo "authorized_for_all_services=nagiosadmin,$NOMBRE" >> /usr/local/nagios/etc/cgi.cfg
echo "authorized_for_all_hosts=nagiosadmin,$NOMBRE" >> /usr/local/nagios/etc/cgi.cfg


echo "ingrese email"

read EMAIL

echo "

define contact {

    contact_name            nagiosadmin             ; Short name of user
    use                     generic-contact         ; Inherit default values from generic-contact template (defined above)
    alias                   Nagios Admin            ; Full name of user
    email                   nagios@localhost ; <<***** CHANGE THIS TO YOUR EMAIL ADDRESS ******
}

define contact {
contact_name                    $NOMBRE
use                             generic-contact
alias                           $NOMBRE
email                           $EMAIL
}

define contactgroup {
contactgroup_name      		admins
alias                   	Nagios Administrators
members                		nagiosadmin,$NOMBRE
}" > /usr/local/nagios/etc/objects/contacts.cfg
}
