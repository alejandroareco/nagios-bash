# GESTOR NAGIOS

El gesto de Nagios esta compuesto de 5 estructuras principales:

- Apache Web Server
- Nagios Core & plugins
- Opciones 
- Monitoreo Extra
- BackUp Log

### **Apache Web Server**

La UI de Nagios necesita de un web server para poder visualizar los checks de Nagios. 
Esta parte del script tiene 2 funciones:

1. *Verificar Apache*: el script hace una consulta al binario de Apache.

2.  En caso de encontrarlo, lo indica por pantalla. Caso contrario, consulta al usuario si desea instalarlo. 

### **Nagios Core & Plugins**

Esta seccion se encarga de instalar y configurar los plugins de Nagios y la version 'Core' del mismo. 
Aqui, se llaman 2 funciones `install.sh` y `plugins.sh`clear

> **install.sh**
Este script instala  Nagios Core y todas sus dependencias. A su vez, llama a otros 3 scripts:

- source pathinstall.sh: se utiliza para hacer un `cd` al directorio donde se descargo Nagios. 
- source cd.sh: se utiliza para reemplazar al comando `cd`
- source remove.sh: se utiliza para eliminar los paquetes de instalacion descargados

`cd` y `rm` no funcionan dentro de scripts bash, por ello se crearon funciones para reemplazar los pasos necesarios para la instalacion.

Se instala ademas modulos `PHP` ya que, en algunos casos, la UI de Nagios puede arrojar errores relacionados a la falta de este modulo.

> **plugins.sh**
Este script instala los plugins necesarios para que Nagios pueda procesar los checks. 
Este script tambien llama a otros scripts para reemplazar comandos, como realizar `install.sh`

### **Opciones**

En esta seccion, se llama a un script el cual contiene una funcion que permite agregar un usuario a Nagios. 
Las Opciones disponibles son las de :
- Agregar un usuario (a traves del script `adduser.sh`)
- Permitir a los usuarios forzar checks en la UI. Esto es importante para poder forzar los checks y ver rapidamemente cambios aplicados, setear downtime, etc
- Reiniciar Nagios
- Consultar el estado del agente de Nagios.


### **Monitoreo Extra**

El objetivo es agregar de manera automatizada monitoreo que no inicia por defualt al instalar Nagios. 
A los archivos de configuracion *commands.cfg* y *localhost.cfg* en `/usr/local/nagios/etc/objects` se agregan las configuraciones necesarias para monitorear DNS y UPTIME.
Estos archvos, al ser protegidos de escritura por root, se modifican con el comando `tee -a`
Dichas modificaciones se realizan a traves de funciones que se encuentran en los scripts `uptime.sh` y `dns.sh`
Se agrego un texto de ayuda, con instrucciones para detener al agente de Nagios e iniciarlo luego de agregar el monitoreo.



### **BackUp de Nagios Log** 

Finalmente, se pregunta al usuario si desea realizar un backup del log de Nagios. 
Dicho backup cuenta con el dia y horario en el que se ejecuta el respaldo.


