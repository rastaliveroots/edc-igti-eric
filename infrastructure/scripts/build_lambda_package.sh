#!/usr/bin/env bash

cd infrastructure

#declara variavel para reutilizacao nas validacoes do diretorio
PACKEGA="package"

#cria o diretorio e instala as dependencias da funcao lambda
if [ -d $PACKAGE ]
then
    echo "O Diretorio "$PACKAGE" js existe."
else
    echo "======================================"
    echo "Criando o diretorio "$PACKAGE"..."
    mkdir $PACKAGE
    echo "O diretorio "$PACKAGE" foi criado."
    echo "======================================"
fi

#declara variavel que localiza o requirements com as dependencias do projeto
FILE_REQUIREMENTES=../etl/lambda_requirementes.txt

#verifica se o arquivo lambda_requirementes existe
if [ -f $FILE_REQUIREMENTES ]
then
    echo "==========================================="
    echo "Instalando dependencias localizadas no "$FILE_REQUIREMENTES""
    pip install --target ./package -r $FILE_REQUIREMENTES
    echo "Dependencias instalados com sucesso"
    echo "============================================"
fi

cd $PACKAGE

#declara variavel que localiza a funcao lambda para reutilizacao no codigo 
LAMBDA_FUNCTION=../../etl/lambda_function.py

#verifica se o arquivo lambda_function.py existe
if [ -f $LAMBDA_FUNCTION ]
then 
    echo "============================================="
    echo "Copiando funcao Handler"
    cp $LAMBDA_FUNCTION .
    echo "Compactando arquivo lambda_functions_payload.zip"
    zip -r9 ../lambda_functions_payload.zip . #compactando o pacote para o deploy
    echo "Arquivo compactado com sucesso"
    echo "============================================="
fi

cd ..