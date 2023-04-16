#!/bin/bash

#checks if a specific file exists. If it doesn't exist, it means the FTP server is being started 
#for the first time and needs to be configured
if [ ! -f "/etc/vsftpd.userlist" ]; then

	#moves a configuration file 
	mv /var/www/vsftpd.conf /etc/vsftpd.conf

	#creates a new user with the username stored in the variable $FTP_USER
	useradd -m -s /bin/bash $FTP_USER
	
	#appends the $FTP_USER to a file /etc/vsftpd.userlist which specifies which users are allowed to login to the FTP server
	echo $FTP_USER > /etc/vsftpd.userlist
	
	#sets the password of the $FTP_USER to the value stored in $FTP_PASSWORD using the chpasswd command
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
	
	#changes the ownership of the /var/www/html directory to the $FTP_USER user
	chown -R $FTP_USER:$FTP_USER /var/www/html

fi

#starts the vsftpd daemon using the configuration file located at /etc/vsftpd.conf by running the /usr/sbin/vsftpd command
/usr/sbin/vsftpd /etc/vsftpd.conf