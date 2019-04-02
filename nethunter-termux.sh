#!/bin/bash
red='\033[0;31m'
echo "${red} Atualizando Repositórios..."
apt update && apt upgrade -y
echo "${red}Instalando Requisitos..."
apt install wget proot tar -y
echo
echo

echo "${red}Downloading NetHunter..."
		case `dpkg --print-architecture` in
		aarch64)
            architectureURL="arm64" ;;
        arm)
            #architectureURL="armhf" ;;
            echo "Selecione a versão do NetHunter:"
            echo "${red}1) Versão completa (Armhf)"
            echo "${red}2) Versão nano (Armhf)"
            read opcao
            case $opcao in
            1)

            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-${architectureURL}-full.tar.xz" -O kali-arm.tar.xz
            # Download
            #wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz" -O kali-armhf.tar.xz

            proot --link2symlink tar -xf kali-armhf.tar.xz
            cd kali-armhf && echo "nameserver 1.1.1.1" > etc/resolv.conf
            cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            unset LD_PRELOAD
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            echo "Para iniciar execute o comando ./startkali.sh"

            ;;

            2)

            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-${architectureURL}-minimal.tar.xz" -O kali-arm.tar.xz
            # Download
            #wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz" -O kali-armhf.tar.xz

            proot --link2symlink tar -xf kali-armhf.tar.xz
            cd kali-armhf && echo "nameserver 1.1.1.1" > etc/resolv.conf
            cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            unset LD_PRELOAD
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            echo "${red}Para iniciar execute o comando ./startkali.sh"

            ;;
            esac
        amd64)
            architectureURL="amd64" ;;
        i*86)
            architectureURL="i386" ;;
        x86_64)
            architectureURL="amd64" ;;
        *)
            echo "Arquitetura desconhecida";;
	esac
