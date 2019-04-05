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
	arm)
        echo "1) Download NetHunter Arm64 (completo)"
        echo "2) Download NetHunter Arm64 (nano)"
        echo "3) Cancelar download"
        read arm64Opcao
        case $arm64Opcao in
            1)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-full.tar.xz" -O kali-arm64.tar.xz
            #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            tar -xf kali-arm64.tar.xz
            proot --link2symlink
            echo "nameserver 8.8.8.8" > kali-arm64/etc/resolv.conf
            profile=.profile
            cat > $profile <<- OEM
            # ~/.profile: executed by Bourne-compatible login shells.

            if [ "$BASH" ]; then
            if [ -f ~/.bashrc ]; then
                . ~/.bashrc
            fi
            fi

            # Add /system/xbin to PATH
            PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
            cat .profile > kali-arm64/root/.profile
            bin=startkali.sh
            echo "${colorred}Montando Sistema..."
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-arm64 -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
            rm kali-arm64.tar.xz
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
            ;;
            2)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-arm64-minimal.tar.xz" -O kali-arm64.tar.xz
            #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            kali-arm64.tar.xz
            proot --link2symlink tar -xf
            echo "nameserver 8.8.8.8" > kali-arm64/etc/resolv.conf
            profile=.profile
            cat > $profile <<- OEM
            # ~/.profile: executed by Bourne-compatible login shells.

            if [ "$BASH" ]; then
            if [ -f ~/.bashrc ]; then
                . ~/.bashrc
            fi
            fi

            # Add /system/xbin to PATH
            PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
            cat .profile > kali-arm64/root/.profile
            bin=startkali.sh
            echo "${colorred}Montando Sistema..."
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-arm64 -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
            rm kali-arm64.tar.xz
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
        esac
    ;;
    sarm)
        echo "1) Download NetHunter arm (completo)"
        echo "2) Download NetHunter arm (nano)"
        echo "3) Cancelar download"
        read armOpcao
        case $armOpcao in
            1)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-full.tar.xz" -O kali-armhf.tar.xz
            #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            tar -xf kali-armhf.tar.xz
            proot --link2symlink
            echo "nameserver 8.8.8.8" > kali-armhf/etc/resolv.conf
            profile=.profile
            cat > $profile <<- OEM
            # ~/.profile: executed by Bourne-compatible login shells.

            if [ "$BASH" ]; then
            if [ -f ~/.bashrc ]; then
                . ~/.bashrc
            fi
            fi

            # Add /system/xbin to PATH
            PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
            cat .profile > kali-armhf/root/.profile
            bin=startkali.sh
            echo "${colorred}Montando Sistema..."
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-armhf -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
            rm kali-armhf.tar.xz
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
            ;;

            2)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-armhf-minimal.tar.xz" -O kali-armhf.tar.xz
            #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            tar -xf kali-armhf.tar.xz
            proot --link2symlink
            echo "nameserver 8.8.8.8" > kali-armhf/etc/resolv.conf
            profile=.profile
            cat > $profile <<- OEM
            # ~/.profile: executed by Bourne-compatible login shells.

            if [ "$BASH" ]; then
            if [ -f ~/.bashrc ]; then
                . ~/.bashrc
            fi
            fi

            # Add /system/xbin to PATH
            PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
            cat .profile > kali-armhf/root/.profile
            bin=startkali.sh
            echo "${colorred}Montando Sistema..."
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-armhf -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
            rm kali-amd64.tar.xz
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
            ;;
            3)
            echo "${colorred}Download cancelado :("
            echo
            ;;
        esac
    ;;
    amd64)
         echo "1) Download NetHunter arm (completo)"
         echo "2) Download NetHunter arm (nano)"
         echo "3) Cancelar download"
         read opcao
        case $opcao in
            1)
             echo
             echo "${colorred}Downloading NetHunter..."
             wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-full.tar.xz" -O kali-amd64.tar.xz
             #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
             tar -xf kali-amd64.tar.xz
             proot --link2symlink
             echo "nameserver 8.8.8.8" > kali-amd64/etc/resolv.conf
             profile=.profile
             cat > $profile <<- OEM
             # ~/.profile: executed by Bourne-compatible login shells.

             if [ "$BASH" ]; then
             if [ -f ~/.bashrc ]; then
                 . ~/.bashrc
             fi
             fi

             # Add /system/xbin to PATH
             PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
             cat .profile > kali-amd64/root/.profile
             bin=startkali.sh
             echo "${colorred}Montando Sistema..."
             cat > $bin <<- OEM
             #!/bin/bash
             unset LD_PRELOAD
             proot --link2symlink -0 -r kali-amd64 -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
             rm kali-arm64.tar.xz
             chmod 700 startkali.sh && termux-fix-shebang startkali.sh
             clear
             echo "${red}Para iniciar execute o comando ./startkali.sh"
             echo
             ;;
            2)
            echo
            echo "${colorred}Downloading NetHunter..."
            wget "https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-minimal.tar.xz" -O kali-amd64.tar.xz
            #kaliArm=/data/data/com.termux/files/home/nethunter-termux/kali-armhf/
            tar -xf kali-amd64.tar.xz
            proot --link2symlink
            echo "nameserver 8.8.8.8" > kali-amd64/etc/resolv.conf
            profile=.profile
            cat > $profile <<- OEM
            # ~/.profile: executed by Bourne-compatible login shells.

            if [ "$BASH" ]; then
            if [ -f ~/.bashrc ]; then
                . ~/.bashrc
            fi
            fi

            # Add /system/xbin to PATH
            PATH="/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin"$

OEM
            cat .profile > kali-amd64/root/.profile
            bin=startkali.sh
            echo "${colorred}Montando Sistema..."
            cat > $bin <<- OEM
            #!/bin/bash
            unset LD_PRELOAD
            proot --link2symlink -0 -r kali-amd64 -w /dev/ -b /sys/ -b /proc/ -b $HOME /bin/env -i HOME=/root PATH=/root/bin:/root/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/system/xbin TERM=xterm-256color LANG=C.UTF-8 /bin/bash --login
OEM
            rm kali-arm64.tar.xz
            chmod 700 startkali.sh && termux-fix-shebang startkali.sh
            clear
            echo "${red}Para iniciar execute o comando ./startkali.sh"
            echo
            ;;
            3)
            echo "${colorred}Download cancelado :("
            echo
            ;;
       esac
    ;;
esac
