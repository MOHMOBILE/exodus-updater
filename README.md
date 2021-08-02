# exodus-updater
This is just a very simple script that will automatically download the newest **Linux-x64** / **Ubuntu** version of the wallet "exodus" and download it, as the wallet itself won't provide a possibility to update it.

# Usage 
Just download the script via

    sudo git clone MOHMOBILE/exodus-updater /root/

and add it to the bottom of crontab with `sudo crontab -e` like this:

    @reboot screen -dmSL exodus_update -Logfile /root/logs/exodus_update.log bash /root/exodus_update.sh
   
this also has the large benefit of logging  the scripts output to `/root/logs`

And yes, you should never run a script as root, but in this case it is nessesary due to the installation of the wallet.

