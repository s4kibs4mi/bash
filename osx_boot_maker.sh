sudo apt-get install dmg2img
echo "Please write dmg file absolute path : "
read dmg_path
echo "Please write usb drive address ( ex : /dev/sdb ) : "
read device_address

sudo dmg2img -v -i $dmg_path -o $device_address
