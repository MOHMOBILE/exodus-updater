﻿# exodus-update
This is just a very simple script that will automatically download the newest **Linux-x64** / **Ubuntu** version of the wallet "exodus" and download it, as the wallet itself won't provide a possibility to update it.

# Usage 
Just download the script via

    wget -O /root/exodus_update.sh https://raw.githubusercontent.com/MOHMOBILE/exodus-updater/main/exodus_update.sh

and add it to the bottom of crontab with `sudo crontab -e` like this:

    00 */3* * * screen -dmSL exodus_update -Logfile /root/logs/exodus_update.log bash /root/exodus_update.sh
   
this also has the large benefit of logging  the scripts output to `/root/logs`.
It automatically checks for updates every 3 hours. If you want to change it, you can change the /3 part above.

And yes, you should never run a script as root, but in this case it is nessesary due to the installation of the wallet.

