#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Digite pelo menos um arquivo dentro da pasta codigo (sem o nome da pasta)"
	exit 1
fi

if [ $# -gt 2 ]; then
	echo "Apenas dois arquivos são aceitos: uma entrada e uma saída"
	exit 1;
fi

if [ "$1" = "--help" ]; then
	echo "----------------------------------------------------------------"
	echo "Exemplos de como usar o run.sh: "
	echo "	Exemplo 1: ./run.sh alo.avg"
	echo "		Terá a saída do analisador léxico no terminal"
	echo "	Exemplo 2: ./run.sh alo.avg saida-alo.txt"
	echo "		Terá a saída do analisador léxico dentro do arquivo saida-tokens/saida-alo.txt"
	echo "----------------------------------------------------------------"
	exit 1;
fi

entrada="codigos/$1"
echo "Arquivo de entrada: $entrada"
if [ "$2" != "" ]; then
	saida="saida-tokens/$2"
	echo "Arquivo de saída: $saida"
	flex "avg-lexic-compiler.l" && gcc "lex.yy.c" -ll && ./a.out < "$entrada" > "$saida" 
else
	echo ""
	flex "avg-lexic-compiler.l" && gcc "lex.yy.c" -ll && ./a.out < "$entrada" 
fi
	rm "lex.yy.c" "a.out"
