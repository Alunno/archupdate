#!/bin/bash
# Verifica status do serviço

qtde=$(ps aux | grep -x "conky" | wc -l)

while true 
	do
if test "$qtde" = "1"
then
	#echo "conky não está em execução";
	#echo "executando agora!";
	sleep 60
else
	sleep 30
	conky;
	#echo "conky em execução";
	#echo "nada a ser feito.";
fi
done
