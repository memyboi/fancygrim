# yes i recycled this
# i'm lazy ;-;
GREEN='\033[0;32m'
BLUE='\033[0;34m' 
CLEAR='\033[0m'

echo -e "${BLUE}> sudo chmod u+x ./fancygrim/fancygrim${CLEAR}"
sudo chmod u+x ./fancygrim/fancygrim
echo -e "${BLUE}> sudo mv ./fancygrim/fancygrim /usr/bin${CLEAR}"
sudo mv ./fancygrim/fancygrim /usr/bin
echo -e "${BLUE}> sudo rm -rf ./fancygrim${CLEAR}"
sudo rm -rf ./fancygrim
echo -e "${GREEN}fancygrim is now installed!"
echo -e "${GREEN}run the command 'fancygrim' to see usage!"
echo -e "${CLEAR}"
fancygrim