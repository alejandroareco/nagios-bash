#!/bin/bash

#Instituto ISTEA
#Materia: Programacion
#Profesor: Sergio Pernas
#Alumno: Alejandro Areco
#Trabajo Final

#VERIFICIO SI EL USUARIO ES 'ROOT'. EN CASO DE NO SERLO, ENVIO MENSAJE DE AVISO

if [ $UID -ne 0 ]; then
	echo "ATENCION: este programa solo puede ser ejecutado por usuario 'root'"
	exit 1
fi

echo ""

echo "Bienvenido al gestor de Nagios"

#VERIFICO SI APACHE YA ESTA INSTALADO
#SI NO ESTA INSTALADO, PREGUNTO SI SE QUIERE INSTALAR

sudo which apache2 &> /dev/null

if [ $? -eq 0 ]; then
	echo "Apache esta instalado. Presione 'enter' para continuar"
else
	echo "Apache no esta instalado. Desea instalarlo? [Y/n]"
fi

read INSTALAR

if [ "$INSTALAR" == "Y" ]; then
	sudo apt update && apt install apache2
else
	echo "RECUERDE que para que Nagios funcione, Apache debe estar instalado"
	#echo "Por favor, vuelva a ejecutar el programa"
	#exit 1
fi

echo "" 
echo ""

echo "/// INSTALACION DE NAGIOS CORE & PLUGINS //"

echo ""

source install.sh
source plugins.sh

echo "Seleccione el componente a instalar"

echo ""

while :;do
echo "1) Nagios Core"
echo "2) Nagios Plugins"
echo "3) Todos los componentes"
echo "4) Continuar"

read -p "Ingrese numero de opcion: " OPC

	case $OPC in
		1)
			clear
			install
	#		break
			;;
		2) 	clear
			plugins
	#		break
			;;
		3)	clear
			plugins
			install
	#		break
			;;
		4)      break
			;;
	esac
	clear
	done

IP=$(hostname -I)

echo ""

echo "Para acceder a Nagios Web, ingrese a $IP/nagios"
echo "El usuario para acceder es 'nagiosadmin'"

echo ""

echo "/// OPCIONES DE NAGIOS //"

echo ""

source adduser.sh

echo "Opciones"

echo ""

while :;do
echo "1) Agregar Usuario"
echo "2) Permitir a usuarios forzar checks"
echo "3) Reiniciar Nagios"
echo "4) Consultar estado de servicio Nagios"
echo "5) Continuar"

read -p "Ingrese numero de opcion: " OPC

	case $OPC in
		1)
			clear
			adduser
	#		break
			;;
		2) 	clear
			sudo chown -R nagios:www-data /usr/local/nagios/var/rw/
	#		break
			;;
		3)	clear
			sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
	#		break
			;;
		4)	clear
		      	systemctl status nagios
	#		break	
			;;
		5)      break
			;;
	esac
	clear
	done

echo ""

echo "/// AGREGAR MONITOREO EXTRA A NAGIOS //"

echo ""

source uptime.sh
source dns.sh

echo "Opciones"

source ayuda.sh

echo ""

while :;do
echo "1) Uptime"
echo "2) DNS"
echo "3) Ayuda"
echo "4) Iniciar Nagios"
echo "5) Continuar"

read -p "Ingrese numero de opcion: " OPC

	case $OPC in
		1)
			clear
			uptime
			sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
			echo "Se recomiendo ver 'Ayuda (opc 3) antes de ver Nagios UI"
	#		break
			;;
		2) 	clear
			dns
			sudo /usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
			echo "Se recomienda ver 'Ayuda (opc 3) antes de ver Nagios UI"
	#		break
			;;
		3)      clear
			ayuda
	#		break
			;;
		4)	clear
			/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
	#		break
			;;
		5)      clear
			break
			;;
	esac
	clear
	done


echo "Desea realizar un backup del log de Nagios? [Y/n]?"

read BACKUP

source logbkp.sh

if [ "$BACKUP" == "Y" ]; then
	bkp
	echo "El backup se encuentra en /home/alejandro/final-programacion"
	echo ""
	echo "Gracias por utilizar el gestor Nagios"
else
	echo "Gracias por utilizar el gestor Nagios"

fi
