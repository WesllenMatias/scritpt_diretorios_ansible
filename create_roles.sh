#!/bin/bash

#Criando estrutura de diretórios das Roles
#Arvore de Diretorio a ser criada
#roles
#  /common
#    /defaults
#    /files
#    /templates
#    /tasks
#    /meta
#    /handlers
#    /vars


inicio='\033[01;32m'
fim='\033[00;37m'
err_ini='\033[05;31m'
diretorio="$(pwd)/roles"
cmd_tree="$(which tree)"

if [ $? == 0 ] 
then
    echo -e "$inicio>>>Dependencias do Script OK! Iniciando Script!$fim"
else
    echo -e "$err_ini>>>Dependencia tree não está instalada... Instalando...$fim"
    sleep 2
    sudo /usr/bin/apt install tree -y
fi

echo -e "$inicio>>>Criando Pasta Roles$fim"
mkdir roles
sleep 1
echo -e "$inicio>>>Entrando em Roles$fim"
cd roles
sleep 1
echo -e "$inicio>>>Criando subpastas$fim"
mkdir -p common/{files,templates,tasks,meta,handlers,defaults,vars}
sleep 1

/usr/bin/tree "$(pwd)"

if [ -d $diretorio ] 
then
    echo -e "$inicio>>> Fim Diretorios Criados com Sucesso!!!$fim"
else
    echo -e "$err_ini>>> Houve algum problema ao tentar criar os Diretórios"
fi
