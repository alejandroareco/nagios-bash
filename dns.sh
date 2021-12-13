#!/bin/bash

dns () {

echo "define command {

    command_name    check_dns
    command_line    \$USER1$/check_dns -H www.google.com -t 60
}" |& tee -a /usr/local/nagios/etc/objects/commands.cfg


echo "define service {

    use                     local-service           ; Name of service template to use
    host_name               localhost
    service_description     DNS
    check_command           check_dns
}" |& tee -a /usr/local/nagios/etc/objects/localhost.cfg

}
