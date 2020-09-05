#!/bin/bash

# add groups required to access ttyUSB
echo -e "\033[1;33m=== adding user to groups dialout and tty ===\033[0m"
sudo usermod -a -G dialout,tty "$USER" 

# add udev rule for PlatformIO supported boards/devices
if [ ! -s /etc/udev/rules.d/99-platformio-udev.rules ]; then
  echo -e "\033[1;33m=== installing 99-platformio-udev.rules ===\033[0m"
  curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
fi

# install python
echo -e "\033[1;33m=== installing pyhton3 ===\033[0m"
sudo apt-get install python3

# install PlatformIO CLI
echo -e "\033[1;33m=== installing PlatformIO CLI ===\033[0m"
python3 -c "$(curl -fsSL https://raw.githubusercontent.com/platformio/platformio/develop/scripts/get-platformio.py)"

# add path to platformio bin folder if not yet present in .profile
if ! grep -q 'platformio' ~/.profile; then
  echo -e "\033[1;33m=== adding PlatformIO bin folder to path ===\033[0m"
  echo '' >> ~/.profile
  echo '# set PATH so it includes the platformio bin folder' >> ~/.profile
  echo 'if [ -d "$HOME/.platformio/penv/bin" ] ; then' >> ~/.profile
  echo '  PATH="$HOME/.platformio/penv/bin:$PATH"' >> ~/.profile
  echo 'fi' >> ~/.profile
fi

echo -e "\033[0;32m------------------------------------------------------------"
echo -e "Installation finished - \033[1;31mplease logout or restart now."
echo -e "\033[0;32m------------------------------------------------------------"