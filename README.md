# fancygrim
a small bash script that I use for screenshotting. (hyprland only)  

<img src="example.png">
  
## features:
- area, window & full screenshots
- shadows & corner rounding
- full config
- notification w/ preview

## dependencies:
- grim
- slurp
- imagemagik
- jq
- hyprpicker
- hyprctl
- wl-clipboard
- bash
  
Arch Example: 
```
sudo pacman -S grim slurp imagemagik jq wl-clipboard && yay -S hyprpicker
```
(hyprpicker is in the AUR, bash is needed to run the command, hyprctl comes with hyprland ootb)

# installation:
```
git clone https://github.com/memyboi/fancygrim && bash ./fancygrim/installation.sh
```
(installation.sh found at the root of this repo, check if you don't trust this.)
