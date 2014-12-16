#!/bin/bash

##################################################################################
##	Email : s4kibs4mi@gmail.com 						##
##	Web : http://www.sakibsami.com 						##
##	** Use this script at your own risk **					##
##	Ref : https://software.intel.com/en-us/videos/setting-up-kvm-on-linux 	##
##################################################################################

wget -q --spider http://google.com
if [ $? -eq 0 ]; then
	echo "Please First goto your bios settings"
	echo "and enable **VIRTUALIZATION TECHNOLOZY** , if it's disabled"
	echo "Please write your system's android sdk path (without trailing slash): "
	read sdkpath
	echo "Your system sdk path is :"
	echo $sdkpath
	sdkpath="$sdkpath/tools"

	x=$(egrep -c '(vmx|svm)' /proc/cpuinfo)

	if [ $x -ne 0 ]; then
		sudo apt-get install cpu-checker
		ch=$(kvm-ok)
		if [[ $ch == *"KVM acceleration can be used"* ]]; then
			n=$(egrep -c 'lm' /proc/cpuinfo)
			if [ $n -ne 0 ]; then
				kernel=$(uname -m)
				if [[ $kernel = *"64"* ]]; then
					sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
					echo
					echo "Please enter a user name for kvm : "
					read username
					sudo adduser $username kvm
					sudo adduser $username libvirtd
					isok=$(sudo virsh -c qemu:///system list)
					if [[ $isok == *"Id"* ]]; then
						echo
						echo "Installation completed sucessfully :)"
						echo "Now running AVD manager"
						sdkpath="$sdkpath/android avd"
						$($sdkpath)
					else
						echo "KVM Configuration failed"
					fi
				else
					echo
					echo "KVM isn't recomented for your system"
				fi
			else
				echo
				echo "KVM isn't supported"
			fi
		else
			echo
			echo "KVM isn't supported"
		fi
	else
		echo
		echo "KVM isn't supported"
	fi
else
	echo "No internet connection"
fi
