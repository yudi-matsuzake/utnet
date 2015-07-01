#!/bin/bash

# você é o root?
if [ $UID -ne 0 ]
then
	>&2 echo "ERRO: Você é o root?"
	exit
fi

dpath="/etc/NetworkManager/dispatcher.d/"

#dpath existe?
if [ ! -e "$dpath" ]
then
	echo "Pasta $dpath não existe, não sei o que fazer, desculpe. :("
	echo "Voce pode informar sua distribuiçao ou como um bug em github.com/yudi-matsuzake/utnet"
	exit
fi

# copia para dpath
cp -v ut.sh "$dpath"

echo "pronto"
