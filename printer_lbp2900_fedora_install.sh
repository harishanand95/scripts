wget http://files.canon-europe.com/files/soft40567/software/CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
tar -xvzf CAPT_Printer_Driver_for_Linux_V220_uk_EN.tar.gz
cd CAPT_Printer_Driver_for_Linux_V220_uk_EN/64-bit_Driver/RPM/
sudo rpm -i cndrvcups-common-2.20-1.x86_64.rpm
sudo rpm -i cndrvcups-capt-2.20-1.x86_64.rpm
sudo mkdir /var/ccpd
sudo mkfifo /var/ccpd/fifo0
sudo mkdir /var/captmon
sudo chown -R lp:lp /var/ccpd
sudo /usr/sbin/lpadmin -p LBP2900 -m CNCUPSLBP2900CAPTK.ppd -v ccp:/var/ccpd/fifo0 -E
sudo /usr/sbin/ccpdadmin -p LBP2900 -o /dev/usb/lp0
sudo /etc/init.d/ccpd start
