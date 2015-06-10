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
	echo "pasta $dpath não existe, não sei o que fazer :("
fi

# copia para dpath
cp ut.sh "$dpath"
