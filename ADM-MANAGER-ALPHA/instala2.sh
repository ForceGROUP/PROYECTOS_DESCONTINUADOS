#!/bin/bash

fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
echo -ne "\033[1;33m ["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m##"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "\033[1;33m ["
done
echo -e "\033[1;33m]\033[1;31m -\033[1;32m 100%\033[1;37m"
}

function_verify () {
  echo "verify" > $(echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g;s/$/ /'))
}

instalar_fun () {
cd /etc/adm-lite && bash cabecalho --instalar
}

elimined_fun () {
text=$(source trans -b pt:${id} "Instalando")
echo -e "${cor[2]} Update"
fun_bar 'apt-get install screen' 'apt-get install python'
echo -e "${cor[2]} Upgrade"
fun_bar 'apt-get install lsof' 'apt-get install python3-pip'
echo -e "${cor[2]} $text Lsof"
fun_bar 'apt-get install python' 'apt-get install unzip'
echo -e "${cor[2]} $text Python3"
fun_bar 'apt-get install zip' 'apt-get install apache2'
echo -e "${cor[2]} $text Unzip"
fun_bar 'apt-get install ufw' 'apt-get install nmap'
echo -e "${cor[2]} $text Screen"
fun_bar 'apt-get install figlet' 'apt-get install bc'
echo -e "${cor[2]} $text Figlet"
fun_bar 'apt-get install lynx' 'apt-get install curl'
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart > /dev/null 2>&1
echo -e "${cor[1]}=================================== "
}

valid_fun () {
echo -e "${cor[2]}Ups !, Clave válida! Instalando ..."
echo -e "${cor[1]}=================================== "
[[ -d /etc/adm-lite ]] && rm -rf /etc/adm-lite
mkdir /etc/adm-lite
cd /etc/adm-lite
echo "cd /etc/adm-lite && bash ./menu" > /bin/menu && chmod +x /bin/menu
echo "cd /etc/adm-lite && bash ./menu" > /bin/adm && chmod +x /bin/adm
echo "cd /etc/adm-lite && bash ./menu" > /bin/h && chmod +x /bin/h
touch /etc/adm-lite/index.html
_contador="1"
while read arq_adm; do
cd /etc/adm-lite
wget $arq_adm -o /dev/null
_contador=$(($_contador + 1))
done < $HOME/lista
echo -e "${cor[3]}Ahora se instalarán las dependencias"
echo -e "${cor[1]}=================================== "
cd /etc/adm-lite
chmod +x ./*
instalar_fun
[[ -e $HOME/lista ]] && rm $HOME/lista
v1=$(curl -sSL "https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/PROYECTOS_DESCONTINUADOS/master/ADM-MANAGER-ALPHA/versaoatt")
echo "$v1" > /etc/adm-lite/versao_script
echo -e "${cor[1]}=================================== "
echo -e "${cor[3]}Procedimiento perfecto realizado con Éxito!"
echo -e "${cor[1]}=================================== "
echo -e "${cor[3]} |âˆ†| ${cor[2]}Ahora solo configura su VPS con el menú de instalación"
echo -e "${cor[1]}=================================== "
echo -e "${cor[2]}Utilice los comandos: menú, adm"
echo -e "${cor[2]}y accede al script, buen uso!"
echo -e "${cor[1]}=================================== "
echo -ne " \033[0m"
}

verify_fun () {
wget -O lista https://raw.githubusercontent.com/AAAAAEXQOSyIpN2JZ0ehUQ/PROYECTOS_DESCONTINUADOS/master/ADM-MANAGER-ALPHA/Install/lista -o /dev/null
}

error_fun () {
echo -e "${cor[5]}=================================== "
echo -e "\033[1;31mYour apt-get Error!"
echo -e "Reboot the System!"
echo -e "Use Command:"
echo -e "\033[1;36mdpkg --configure -a"
echo -e "\033[1;31mVerify your Source.list"
echo -e "For Update Source list use this comand"
echo -e "\033[1;36mwget https://www.dropbox.com/s/sb82ddp9fjcg1ub/apt-source.sh && chmod 777 ./* && ./apt-*"
echo -e "${cor[5]}=================================== "
echo -ne "\033[0m"
exit 1
}

rm $(pwd)/$0
cor[1]="\033[0;34m"
cor[2]="\033[1;33m"
cor[3]="\033[1;31m"
cor[5]="\033[1;32m"
cor[4]="\033[0m"
cd $HOME
#INSTALACOES#
if ! apt-get install at -y > /dev/null 2>&1
then
error_fun
fi
if ! apt-get install netpipes -y > /dev/null 2>&1
then
error_fun
fi
if ! apt-get install gawk -y > /dev/null 2>&1
then
error_fun
fi
locale-gen en_US.UTF-8 > /dev/null 2>&1
update-locale LANG=en_US.UTF-8 > /dev/null 2>&1
wget -O trans https://www.dropbox.com/s/l6iqf5xjtjmpdx5/trans?dl=0 -o /dev/null 2>&1
mv -f ./trans /bin/ && chmod 777 /bin/*
echo -e "${cor[1]}=================================== "
echo -e "${cor[5]} INSTALADOR ADM-SCRIPTS Â®"
echo -e "${cor[1]}=================================== "
echo -e "${cor[3]} Inicio de la instalación..."
echo -e "${cor[1]}=================================== "
echo -ne "${cor[4]}"
while true; do
verify_fun
[[ $? = "0" ]] && break
done
valid_fun