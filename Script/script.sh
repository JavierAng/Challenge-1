#!/bin/bash

#Argumentos desde la línea de comandos
VM_NAME=$1
OS_TYPE="Linux"
CPUS=$2
RAM=$3
VRAM=$4
HDD_SIZE=$5
SATA_CONTROLLER=$6
IDE_CONTROLLER=$7

VBoxManage createvm --name $VM_NAME --ostype $OS_TYPE --register
VBoxManage modifyvm $VM_NAME --cpus $CPUS --memory $RAM --vram $VRAM
VBoxManage createmedium disk --filename $VM_NAME.vdi --size $HDD_SIZE
VBoxManage storagectl $VM_NAME --name $SATA_CONTROLLER --add sata --controller IntelAhci
VBoxManage storageattach $VM_NAME --storagectl $SATA_CONTROLLER --port 0 --device 0 --type hdd --medium $VM_NAME.vdi
VBoxManage storagectl $VM_NAME --name $IDE_CONTROLLER --add ide
VBoxManage showvminfo $VM_NAME
