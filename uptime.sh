#!/bin/bash

uptime () {

echo "define command {

    command_name    check_uptime
    command_line    \$USER1$/check_uptime -u days -c \$ARG1
}" |& tee -a /usr/local/nagios/etc/objects/commands.cfg

echo "define service {

    use                     local-service           ; Name of service template to use
    host_name               localhost
    service_description     UPTIME
    check_command           check_uptime!1
}" |& tee -a /usr/local/nagios/etc/objects/localhost.cfg

}
