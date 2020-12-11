#!/bin/bash

#Change the directory to /tmp
cd /tmp

#download the java
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm

#Install the jdk-8u131-linux-x64.rpm
rpm -ivh jdk-8u131-linux-x64.rpm

#Change the directory to /opt
cd /opt

# Download the tomcat
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.38/bin/apache-tomcat-9.0.38-windows-x64.zip

#unzip the tomcat
unzip apache-tomcat-9.0.38-windows-x64.zip

#remove the downloaded tomcat zip
rm -f apache-tomcat-9.0.38-windows-x64.zip

#rename the folder/directory apache-tomcat-9.0.38-windows-x64 to tomcat9
mv apache-tomcat-9.0.38 tomcat9

# change the permoissions for the scripts in the /opt/tomcat9/bin/*.sh directory
cd /opt/tomcat9/bin
chmod 755 *.sh

#start the tomcat
./startup.sh

#Deploy shoppingcar.war
#download to /tmp
cd /tmp
wget https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/10g/r3/cluster/session_state/files/shoppingcart.zip
unzip shoppingcart.zip

#copy shoppingcar.war to /opt/tomcat9/webapps/
cp shoppingcart.war /opt/tomcat9/webapps/
