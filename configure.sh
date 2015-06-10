#!/bin/bash

# você é o root?
if [ $UID -ne 0 ]
then
	>&2 echo "ERRO: Você é o root?"
	exit
fi

while [[ ! "$matricula" =~ a?[0-9]+ ]]
do
	read -p "matricula: " matricula
done

read -sp "senha: " senha

if [[ ! "$matricula" =~ a.* ]]
then
	matricula="a$matricula"
fi

echo "$matricula:$senha" > /root/.utnet
