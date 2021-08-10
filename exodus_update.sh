######################
#Script by MOHMOBILE #
#© 2021              #
######################

#!/bin/bash

installedversion=$(su -c "exodus --version" $(id -nu 1000))

for i in {0..30}
do
    checkversion=$(date -d "now - $i days" "+%y.%-m.%-d")
    curl -fs https://downloads.exodus.com/releases/exodus-linux-x64-$checkversion.deb
    if [[ $? == 23 ]]
      then
      TempArray+=($i)
    fi
done

dlversion=$(date -d "now - ${TempArray[1]} days" "+%y.%-m.%-d")

if [[ $dlversion == $installedversion ]]
  then
  echo "$(date +%d.%m.%y) $(date +%H:%M:%S) -> No updates found. Your exodus is on the latest version."
  exit 0
fi

wget -q https://downloads.exodus.com/releases/exodus-linux-x64-$dlversion.deb -P /tmp/exodus/

if [ $? == 0 ]
  then
    echo "$(date +%d.%m.%y) $(date +%H:%M:%S) -> Version $dlversion successfully downloaded!"

    sudo dpkg -i /tmp/exodus/exodus-linux-x64-$dlversion.deb &> /dev/null
    if [ $? == 0 ]
      then
        echo "$(date +%d.%m.%y) $(date +%H:%M:%S) -> Version $dlversion successfully installed!"
      else
        echo "$(date +%d.%m.%y) $(date +%H:%M:%S) -> Installation failed! Something went wrong."
    fi
fi
