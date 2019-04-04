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
            kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            proot --link2symlink tar -xf kali-armhf.tar.xz
            cd kali-armhf && echo "nameserver 8.8.8.8" > etc/resolv.conf
            
            cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b ${kaliArm}dev/ -b ${kaliArm}proc/ -b ${kaliArm}sys/ -b ${kaliArm}system/ -b ${kaliArm}mnt -w ${kaliArm}root ${kaliArm}usr/bin/env -i HOME=${kaliArm}root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            unset LD_PRELOAD
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            rm kali-armhf.tar.xz
            clear
            echo "Para iniciar execute o comando ./startkali.sh"
            echo
            ;;

            2)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz" -O kali-armhf.tar.xz
            kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            proot --link2symlink tar -xf kali-armhf.tar.xz --exclude='dev'||:
            cd kali-armhf && echo "nameserver 8.8.8.8" > etc/resolv.conf
            cd ..
            #cd ../ && echo "proot --link2symlink -0 -r kali-armhf -b ${kaliArm}dev/ -b ${kaliArm}proc/ -b ${kaliArm}sys/ -b ${kaliArm}system/ -b ${kaliArm}mnt -w ${kaliArm}root ${kaliArm}usr/bin/env -i HOME=${kaliArm}root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login" > startkali.sh
            bin=kali.sh
            echo "Criando iniciador"
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-armhf -b /dev/ -b /sys/ -b /proc/ -b ${kaliArm}home -b ${kaliArm}system/ -b /mnt -w /usr/bin/env -i HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=$TERM LANG=C.UTF-8 /bin/bash --login
OEM
            chmod 700 kali.sh && termux-fix-shebang kali.sh
            rm kali-armhf.tar.xz
            clear
            echo "${red}Para iniciar execute o comando ./kali.sh"
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
