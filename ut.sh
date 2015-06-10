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

if [ "$2"!="down" ]
then
	echo_log "`iwgetid`"
	echo_log "SSID: $ssid"
	echo_log "UID: $UID"
	echo_log "AC MAC: $ac_mac"
	if [ "$ssid"="UTFPRWEB" ]
	then
		echo_log "Método http"
	fi
fi

echo "pronto"
