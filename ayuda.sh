#!/bin/bash


ayuda () {

	
	echo ""

	echo " /// AYUDA NAGIOS ///"
	
	echo "
	Los plugins de Nagios pueden llegar a demorar hasta 5 minutos en aparecer.
	Se recomienda detener el agente de nagios manualmente e iniciar el mismo en caso de
	querer ver los cambios aplicados en forma inmediata"

	echo ""

	echo "A traves de la UI: 
	1) seleccione en el menu de la izquierda la opcion 'Processinfo'
	2) en 'Process commands", seleccione 'Shutdown the Nagios Process'"
	3) en la terminal Bash ingrese '/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg' U Opcion 4 de este menu
	4) puede verificar el status de nagios ingresando 'systemctl status nagios'"

	echo ""
	echo "A traves de la Terminal:
	1) ps ax | grep nagios 
	2) el primer resultado que arroje el comando anterior, es el agente de Nagios
	3) ejecute kill pid (numero de pid)
	4) ejecute /usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
	5) puede verificar el status de nagios ingresando systemctl 'status nagios'"

}
