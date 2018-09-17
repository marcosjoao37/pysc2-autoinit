#!/bin/bash

# COLORS
red=`tput setaf 1`
yellow=`tput setaf 3`
reset=`tput sgr 0`
black_background=`tput setab 0`
# END COLORS

echo "Hello, there!"
echo "Before you can start code your fucking crazing hacking techniques and"
echo "knowledgement, we need to download some necessary packages for the"
echo "proper operation of the enviroment."
echo ""
echo "If you ${yellow}${black_background}already installed${reset} or"
echo "if you want to download, configure and create the packages yourself, "
echo "${yellow}${black_background}just escape${reset} the following question."
echo ""
echo "Download, extract and configure StarCraft 2 client and maps?"
echo "(Requires a minimum of ${yellow}${black_background}10GB${reset} free on your disk!!!)"
echo "(Y) Yes, do it for me;"
echo "(N) No, I do it by myself;"
read -p "(Y/N) " downloadData
echo ""

if [ $downloadData = "Y" ] || [ $downloadData = "y" ]; then
  echo "Checking if ${yellow}${black_background}wget${reset} is installed..."
  dpkg -s wget > /dev/null 2>&1
  isInstalled=$?
  if [ $isInstalled -gt 0 ]; then
    echo "${yellow}${black_background}wget${reset} package isn't installed."
    echo "To install, just type in your terminal:"
    echo "${yellow}${black_background}sudo apt install wget${reset}\n"
    exit 1
  fi

  echo "Checking if ${yellow}${black_background}unzip${reset} is installed..."
  dpkg -s unzip > /dev/null 2>&1
  isInstalled=$?
  if [ $isInstalled -gt 0 ]; then
    echo "${yellow}${black_background}unzip${reset} package isn't installed."
    echo "To install, just type in your terminal:"
    echo "${yellow}${black_background}sudo apt install unzip${reset}\n"
    exit 1
  fi

  echo "Checking if ${yellow}${black_background}pv${reset} is installed..."
  dpkg -s pv > /dev/null 2>&1
  isInstalled=$?
  if [ $isInstalled -gt 0 ]; then
    echo "${yellow}${black_background}pv${reset} package isn't installed."
    echo "To install, just type in your terminal:"
    echo "${yellow}${black_background}sudo apt install pv${reset}\n"
    exit 1
  fi
  echo ""

  echo "Searching for StarCraft 2 Client data..."
  fileExist=$(find $HOME -maxdepth 1 -type f -name 'SC2.4.1.2.60604_2018_05_16.zip' | wc -l)
  if [ $fileExist -eq 0 ]; then
    echo "Downloading StarCraft 2 Client data... (~4.2GB)"
    wget -P=$HOME http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.1.2.60604_2018_05_16.zip
    echo "\"StarCraft 2 Client data\" download finished!"
  else
    echo "\"StarCraft 2 Client data\" found at \"$HOME/SC2.4.1.2.60604_2018_05_16.zip\"!"
  fi
  echo ""

  echo "Searching for StarCraft 2 Ladder 2018 Season 2 Map data..."
  fileExist=$(find $HOME -maxdepth 1 -type f -name 'Ladder2018Season2_Updated.zip' | wc -l)
  if [ $fileExist -eq 0 ]; then
    echo "Downloading StarCraft 2 Ladder 2018 Season 2 Map data... (~22MB)"
    wget -P=$HOME http://blzdistsc2-a.akamaihd.net/MapPacks/Ladder2018Season2_Updated.zip
    echo "\"StarCraft 2 Ladder 2018 Season 2 Map data\" download finished!"
  else
    echo "\"StarCraft 2 Ladder 2018 Season 2 Map data\" found at \"$HOME/Ladder2018Season2_Updated.zip\"!"
  fi
  echo ""

  echo "Searching for StarCraft 2 Melee Map data..."
  fileExist=$(find $HOME -maxdepth 1 -type f -name 'Melee.zip' | wc -l)
  if [ $fileExist -eq 0 ]; then
    echo "Downloading StarCraft 2 Melee Map data... (~300kB)"
    wget -P=$HOME http://blzdistsc2-a.akamaihd.net/MapPacks/Melee.zip
    echo "\"StarCraft 2 Melee Map data\" download finished!"
  else
    echo "\"StarCraft 2 Melee Map data\" found at \"$HOME/Melee.zip\"!"
  fi
  echo ""

  echo "By typing in the password \"iagreetotheeula\" you agree to be bound by the terms of the AI and Machine Learning License (http://blzdistsc2-a.akamaihd.net/AI_AND_MACHINE_LEARNING_LICENSE.html)"
  read -p "(iagreetotheeula) " iagree
  if [ "$iagree" != "iagreetotheeula" ] && [ "$iagree" != "IAGREETOTHEEULA" ]; then
    exit 1
  fi
  echo ""

  echo "Hey! The extraction can take up to ${yellow}${black_background}10 minutes${reset} to get done."
  echo "So, be patient! :D"
  echo ""

  echo "Extracting StarCraft 2 Client data..."
  unzip -P "iagreetotheeula" "$HOME/SC2.4.1.2.60604_2018_05_16.zip" -d "$HOME/" | pv -l >/dev/null
  echo ""

  echo "Extracting StarCraft 2 Ladder 2018 Season 2 Map data..."
  unzip -P "iagreetotheeula" "$HOME/Ladder2018Season2_Updated.zip" -d "$HOME/StarCraftII/Maps/" | pv -l >/dev/null
  echo ""

  echo "Extracting StarCraft 2 Melee Map data..."
  unzip -P "iagreetotheeula" "$HOME/Melee.zip" -d "$HOME/StarCraftII/Maps/" | pv -l >/dev/null
  echo ""

  echo "Delete downloaded StarCraft 2 data .zip files?"
  echo "(Y) Yes;"
  echo "(N) No;"
  read -p "(Y/N) " deleteDownloadedData
  if [ $deleteDownloadedData = "Y" ] || [ $deleteDownloadedData = "y" ]; then
    echo "Deleting $HOME/SC2.4.1.2.60604_2018_05_16.zip ..."
    rm "$HOME/SC2.4.1.2.60604_2018_05_16.zip"
    echo "Deleting $HOME/Ladder2018Season2_Updated.zip ..."
    rm "$HOME/Ladder2018Season2_Updated.zip"
    echo "Deleting $HOME/Melee.zip ..."
    rm "$HOME/Melee.zip"
  fi
  echo ""

  echo "Done!!!"
  echo ""
else
  echo "Ok, then. You can do it! :)"
  echo "Extract all the data in $HOME/StarCraftII/"
  echo ""
fi


echo "Checking if ${yellow}${black_background}python3${reset} is installed..."
dpkg -s python3 > /dev/null 2>&1
isInstalled=$?
if [ $isInstalled -gt 0 ]; then
  echo "${yellow}${black_background}python3${reset} package isn't installed."
  echo "To install, just type in your terminal:"
  echo "${yellow}${black_background}sudo apt install python3${reset}\n"
  exit 1
fi

echo "Checking if ${yellow}${black_background}pip${reset} is installed..."
python3 -c "import pip" > /dev/null 2>&1
isInstalled=$?
if [ $isInstalled -gt 0 ]; then
  echo "${yellow}${black_background}pip${reset} package isn't installed."
  echo "To install, just type in your terminal:"
  echo "${yellow}${black_background}sudo apt install python3-pip${reset}\n"
  exit 1
fi

echo "Checking if ${yellow}${black_background}venv${reset} is installed..."
python3 -c "import venv" > /dev/null 2>&1
isInstalled=$?
if [ $isInstalled -gt 0 ]; then
  echo "${yellow}${black_background}venv${reset} package isn't installed."
  echo "To install, just type in your terminal:"
  echo "${yellow}${black_background}sudo apt install python3-venv${reset}\n"
  exit 1
fi

echo "Checking if ${yellow}${black_background}imd_pysc2_env${reset} virtualenv is created..."
dirEnvCreated=$(find ./ -maxdepth 1 -type d -name 'imd_pysc2_env' | wc -l)
if [ $dirEnvCreated -eq 0 ]; then
  echo "Creating ${yellow}${black_background}'imd_pysc2_env'${reset} virtualenv..."
  python3 -m venv imd_pysc2_env
fi

echo "Changing working directory to ${yellow}${black_background}'imd_pysc2_env'${reset}..."
cd imd_pysc2_env

echo "Activating ${yellow}${black_background}'imd_pysc2_env'${reset} workspace..."
dirEnvCreated=$(find ./ -maxdepth 1 -type d -name 'bin' | wc -l)
if [ $dirEnvCreated -eq 0 ]; then
  echo "${red}ERROR!${reset}"
  echo "Can't find ${yellow}${black_background}'imd_pysc2_env/bin/'${reset} folder."
  echo "Check if the directory exists."
  exit 1
fi
source ./bin/activate

echo "Checking installed packages in ${yellow}${black_background}'imd_pysc2_env'${reset} workspace..."
echo "Checking ${yellow}${black_background}PySC2${reset}..."
python3 -c "import pysc2" > /dev/null 2>&1
isInstalled=$?
if [ $isInstalled -gt 0 ]; then
  echo "Installing ${yellow}${black_background}PySC2${reset}..."
  pip install pysc2
fi
echo "${yellow}${black_background}PySC2${reset} installed!"

echo ""

# printf "\033c"
echo "#######################################################"
echo "## Remember, PySC2 depends on the  ${yellow}${black_background}full StarCraft II${reset}  #"
echo "## game and ${yellow}${black_background}only works${reset} with versions that include the #"
echo "## API, which is ${yellow}${black_background}3.16.1 and above${reset}.                    #"
echo "#######################################################"
echo ""

echo "Initing bash inside ${yellow}${black_background}'imd_pysc2_env'${reset} workspace..."
echo ""
echo "To exit, just type: ${yellow}${black_background}exit${reset}"
echo ""
echo "Do you want to have a try with PySC2? :OO"
echo "${yellow}${black_background}python -m pysc2.bin.agent --map Simple64${reset}"
bash --init-file <(echo ". \"$HOME/.bashrc\"; source ./bin/activate")
