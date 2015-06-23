#!/bin/bash
#################################################################################
#	utnet - script para automatizar o login na rede wifi da UTFPR		#
#-------------------------------------------------------------------------------#
#	Esse script deverá ser colocado na pasta /etc/NetworkManager/ para ser  #
# executado toda vez que o status da rede for alterado. Ele pega a matricula e  #
# a senha do aluno recebidos pelo script "configure.sh", então ele mandará um	#
# por método http para ser realizada a autenticação.				#
#################################################################################

#carrega as funções do utnet
echo_log(){
	local dir="/tmp/utnet.log.d/"
	local file="utnet.log"
	if [ ! -e "$dir" ]
	then
		mkdir "$dir"
	fi
	data="`date +%H%M%S`"
	echo -e "$data\v$1" >> "$dir$file"
}

#Carrega os ids da rede
get_ids(){
	ids="`iwgetid`"
	interface="`echo $ids | awk '{ print $1 }'`"
	ssid=$(echo $ids | awk '{ print $2 }' | grep -Po '(?<=ESSID:\").*?(?=\")')

	ac_mac="`arp | grep $interface | awk '{print $3}'`"
}

#Pega a senha do usuário
user_pass="`cat /root/.utnet`"
u="`echo ${user_pass%%:*}`"
p="${user_pass#$u:}"

echo_log "senha resgatada do usuario $u"

#carrega as ids
get_ids

echo_log "Novo evento na rede ( $1 | $2 )"

if [ "$2" != "down" ]
then
	echo_log "`iwgetid`"
	echo_log "SSID: $ssid"
	echo_log "UID: $UID"
	echo_log "AC MAC: $ac_mac"
	if [ "$ssid" = "UTFPRWEB" ]
	then
		echo_log "Método http com o curl..."
		curl -k 'https://1.1.1.1/login.html' -H 'Host: 1.1.1.1' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0 Iceweasel/31.7.0' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' -H 'Accept-Language: pt-br,en-us;q=0.7,en;q=0.3' -H 'Accept-Encoding: gzip, deflate' -H 'DNT: 1' -H "Referer: https://1.1.1.1/fs/customwebauth/login.html?switch_url=https://1.1.1.1/login.html&ap_mac=$ac_mac&wlan=UTFPRWEB&statusCode=1' -H 'Connection: keep-alive" --data "buttonClicked=4&redirect_url=&err_flag=0&$u=&password=$p" > /tmp/utnet.log.d/curl.out.html

	fi
fi

echo_log "pronto"
