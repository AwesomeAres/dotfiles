#!/bin/sh

[ ! "root" == "$(whoami)" ] && echo "You need to be root, bitch" && exit 1

echo "Choose game mode
1 -> arch
2 -> womit10"

read -r mode

case $mode in 
	"1") echo "setup for arch"
	     :> /etc/modprobe.d/kvm.conf
	     sed -i '/^MODULES/c\MODULES=()' /etc/mkinitcpio.conf
	     mkinitcpio -P 
       	     sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT/c\GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"' /etc/default/grub 	      
	     grub-mkconfig -o /boot/grub/grub.cfg 
	     :>/etc/X11/xorg.conf.d/gpu.conf
	     #because Xorg is a bitch
             #cat >/etc/X11/xorg.conf.d/gpu.conf <<'EOF'
#Section "Device"
#Identifier     "Device0"
#Driver         "amdgpu"
#VendorName     "AMD Corporation"
#BoardName      "AMD Secondary"
#BusID          "PCI:9:0:0"
#EndSection
#
#EOF
             systemctl disable libvirtd ;;
	"2") echo "setup for womit10"
	     echo "options vfio-pci ids=1002:67df,1002:aaf0" > /etc/modprobe.d/kvm.conf
             sed -i '/^MODULES/c\MODULES=(vfio vfio_iommu_type1 vfio_pci vfio_virqfd amdgpu)' /etc/mkinitcpio.conf
	     mkinitcpio -P
       	     sed -i '/^GRUB_CMDLINE_LINUX_DEFAULT/c\GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet video=efifb:off"' /etc/default/grub 	      
	     grub-mkconfig -o /boot/grub/grub.cfg
             cat >/etc/X11/xorg.conf.d/gpu.conf <<'EOF'
Section "Device"
Identifier     "Device0"
Driver         "radeon"
VendorName     "AMD Corporation"
BoardName      "AMD Secondary"
BusID          "PCI:4:0:0"
EndSection
EOF
             systemctl enable libvirtd ;;
	*) echo "no valid input" 
esac 

exit 0
