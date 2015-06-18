#!/bin/bash

# você é o root?
if [ $UID -ne 0 ]
then
	>&2 echo "ERRO: Você é o root?"
	exit
fi


echo -e "OBS.:\vPara alunos, o login tem o formato \"a#####\" onde os #'s é o número da matrícula"
echo

read -p "login: " matricula
read -sp "senha: " senha

echo "$matricula:$senha" > /root/.utnet

echo
echo -
echo "Pronto, o login e a senha foram salvos. Você pode executar o configure.sh novamente, caso você tenha errado."
