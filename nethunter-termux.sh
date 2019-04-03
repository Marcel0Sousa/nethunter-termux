#!/bin/dash
colorred='\033[0;31m'
echo "${colorred}Atualizando Repositórios..."
#apt update && apt upgrade -y
echo "${colorred}Instalando Requisitos..."
#apt install wget proot tar -y
echo
echo
colorred='\033[0;31m'
echo "${colorred}.:: NetHunter Android ::."
case `dpkg --print-architecture` in
	arm64)
        echo "1) Download NetHunter Arm64 (completo)"
        echo "2) Download NetHunter Arm64 (nano)"
        echo "3) Cancelar download"
        read arm64Opcao
        case $arm64Opcao in
            1)

        esac
    ;;
    arm)
        echo "1) Download NetHunter arm (completo)"
        echo "2) Download NetHunter arm (nano)"
        echo "3) Cancelar download"
        read armOpcao
        case $armOpcao in
            1)
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz" -O kali-armhf.tar.xz
            #erroexec= unset LD_PRELOAD
            proot --link2symlink tar -xf kali-armhf.tar.xz
            cd kali-armhf && echo "nameserver 1.1.1.1" > etc/resolv.conf
            cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "Para iniciar execute o comando ./startkali.sh"
            echo
            ;;
            2)
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz" -O kali-armhf.tar.xz

            proot --link2symlink tar -xf kali-armhf.tar.xz
            cd kali-armhf && echo "nameserver 1.1.1.1" > etc/resolv.conf
            cd ../ && echo "unset LD_PRELOAD proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b /data/data/com.termux/files/home -b /system -b /mnt -w /root /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
            ;;
            3)
            echo "Download cancelado :("
            echo
            ;;
        esac
    ;;
    amd64)
    echo "1)"
    echo "2)"
    echo "3)"
    read opcao
    case $opcao in
        1)
        echo ""
        ;;
        2)
        echo ""
        ;;
        3)
        echo ""
        ;;
        esac
    ;;
esac
