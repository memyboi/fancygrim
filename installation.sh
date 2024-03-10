# i've spent way too much time on this

GREEN='\033[0;32m'
BLUE='\033[0;34m' 
CLEAR='\033[0m'
RED='\033[0;31m'

command() {
    echo -e "${BLUE}> $@${CLEAR}"
    $@
}

SCOPE="stable"
if [ "${1}" = "git" ]; then
    SCOPE="git"
elif [ "${1}" = "stable" ]; then
    SCOPE="stable"
else
    echo -e "${RED}No installation scope chosen.\nDefaulting to \"stable\".${CLEAR}"
fi

INSTALLED=false

if [ "${SCOPE}" = "git" ]; then
    command sudo chmod u+x ./fancygrim/fancygrim
    command sudo mv ./fancygrim/fancygrim /usr/bin
    command sudo rm -rf ./fancygrim
    INSTALLED=true
elif [ "${SCOPE}" = "stable" ]; then
    command wget -q https://github.com/memyboi/fancygrim/archive/refs/heads/main.tar.gz
    command tar -zxf ./main.tar.gz
    command sudo chmod u+x ./fancygrim-main/fancygrim
    command sudo mv ./fancygrim-main/fancygrim /usr/bin
    command sudo rm -rf ./fancygrim-main
    command sudo rm -rf ./main.tar.gz
    command sudo rm -rf ./fancygrim
    INSTALLED=true
fi

if [ "${INSTALLED}" = true ]; then # this is useless
    echo -e "${GREEN}fancygrim ${SCOPE} is now installed!"
    echo -e "${GREEN}run the command 'fancygrim usage' to see usage!"
    echo -e "${CLEAR}"
    fancygrim usage
else
    echo -e "${RED}There was an error installing fancygrim ${SCOPE}."
    echo -e "${RED}Please report this as a bug.${CLEAR}"
fi