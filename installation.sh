# i've spent way too much time on this

# deps:
# wget
# sudo
# bash

GREEN='\033[0;32m'
BLUE='\033[0;34m' 
CLEAR='\033[0m'
RED='\033[0;31m'

STABLEVER='0.0.3'

command() { # execute & give feedback without making my life a living hell.
    echo -e "${BLUE}> $@${CLEAR}"
    $@
}

SCOPE="stable" # default
if [ "${1}" = "git" ]; then
    SCOPE="git"
    echo -e "${RED}WARNING: The git version may be unstable.${CLEAR}"
elif [ "${1}" = "stable" ]; then
    SCOPE="stable"
else
    echo -e "${RED}No installation scope chosen.\nDefaulting to \"stable\".${CLEAR}\n"
fi

INSTALLED=false

echo -e "${RED}Elevated permissions is required to install fancygrim.${BLUE}"
read -p "Are you sure that you want to install fancygrim ${SCOPE}? <y/N> " prompt
if [[ $prompt == "y" || $prompt == "Y" || $prompt == "yes" || $prompt == "Yes" ]]; then
    sudo echo -e "${GREEN}Permission granted.${CLEAR}"
else
    command rm -rf ./fancygrim # clean up
    echo -e "${RED}Permission denied. Closing.${CLEAR}"
    exit 0
fi

if [ "${SCOPE}" = "git" ]; then
    command sudo chmod u+x ./fancygrim/fancygrim
    command sudo mv ./fancygrim/fancygrim /usr/bin
    command sudo rm -rf ./fancygrim
    INSTALLED=true
elif [ "${SCOPE}" = "stable" ]; then
    command wget -q https://github.com/memyboi/fancygrim/archive/refs/tags/v$STABLEVER.tar.gz
    command tar -zxf ./fancygrim-$STABLEVER.tar.gz
    command sudo chmod u+x ./fancygrim-$STABLEVER/fancygrim
    command sudo mv ./fancygrim-$STABLEVER/fancygrim /usr/bin
    command sudo rm -rf ./fancygrim-$STABLEVER
    command sudo rm -rf ./fancygrim-$STABLEVER.tar.gz
    command sudo rm -rf ./fancygrim
    INSTALLED=true
fi

if [ "${INSTALLED}" = true ]; then # this is useless
    echo -e "${GREEN}fancygrim (${SCOPE}) is now installed!"
    echo -e "${GREEN}run the command 'fancygrim usage' to see usage!"
    echo -e "${CLEAR}"
    command fancygrim usage
else
    echo -e "${RED}There was an error installing fancygrim ${SCOPE}."
    echo -e "${RED}Please report this as a bug.${CLEAR}"
fi