# ups-shutdown.sh
Make the computer with a simple UPS shuts down automatically,when the AC power is cut off. 

当交流电源被切断时，使带有简单UPS的计算机自动关机。


Usage:
1. git clone to /root/
2. cd ups-shutdown.sh
3. modify ups-shutdown.sh
4. chmod +x ups-shutdown.sh
5. cp ups-shutdown.service /usr/lib/systemd/system/ups-shutdown.service
6. systemctl enable ups-shutdown.service
7. reboot
