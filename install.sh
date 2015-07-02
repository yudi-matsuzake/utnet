#!/bin/bash

######################################################
# install.sh - Instala o utnet 
######################################################
# 	Sua função é instalar o script, simplesmente
# o colocando na pasta /etc/NetworkManager/ e criando
# um atalho para ser executado a qualquer momento
######################################################


# você é o root?
if [ $UID -ne 0 ]
then
	>&2 echo "ERRO: Você é o root?"
	exit
fi

# pasta onde o script ut.sh vai ser executado automaticamente
dpath="/etc/NetworkManager/dispatcher.d"

# pasta onde o comando vai se encontrar
utnetpath="/usr/bin"

# pequeno script para executar o utnet"
utnet=\
"#!/bin/bash
[ \"\$UID\" -eq 0 ] && cd \"$dpath\" || { echo \"Você é o root?\" ; exit ; }
./ut.sh \"wlan0\" \"up\""

#dpath existe?
if [ ! -e "$dpath" ]
then
	echo "Pasta $dpath não existe, não sei o que fazer, desculpe. :("
	echo "Voce pode informar sua distribuição ou como um bug em github.com/yudi-matsuzake/utnet"
	exit
fi

# copia para dpath
cp -v ut.sh "$dpath"

# faz um atalho para executar o utnet
echo "criando atalho..."
echo "$utnet" > "$utnetpath/utnet"
chmod +x "$utnetpath/utnet"

echo "pronto"
