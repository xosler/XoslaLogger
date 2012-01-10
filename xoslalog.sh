#!/bin/bash
#
# 
# Tira um screenshot com o scrot
# Não marque o check box "executar no terminal"
# Lembre: chmod +x neste arquivo
# salvara em uma pasta /root/logs/ano/mes/dia/imagens


while [ true ]; do

#cria a estrutura de pastas no esquema
# /ano/mes/dia/imagens
	
	ano=`date '+%y'`
	mes=`date '+%m'`
	dia=`date '+%d'`
	imagens="imagens"
		
	pasta="logs"

# salvei aqui apenas como exemplo sei lá
	home="/root"	
	
	diretorio=$home/$pasta/$ano/$mes/$dia/$imagens	

# se esse diretório ainda não existe, ele cria.
	if [ ! -e $diretorio ]; then
		mkdir -p  $diretorio
	fi
	
	
# Nome do seu screenshot
	screenshot="screenshot";


#pega a quantidade de arquivos na pasta, para sempre criar uma imagem com 
#um sequencial, para ordenar e não repetir as imagens,
	quantidade=`ls $diretorio | wc -l`;
	cont=$((quantidade+=1))


# adiciona a extensão
	extension='.jpg';
		
		
# gera o caminho completo deste screenshot
	file="$diretorio/$screenshot-$cont$extension ";
	echo $file
	
	
# usa o scrot
# você pode também diminuir a qualidade da imagem para que ela não ocupe tanto espaço
# com o comando scrot -q 75 
# isso deixara a imagem com 75% da qualidade original
	scrot $file;

# Espera por 15 segundos pra executar novamente 
# se quiser mais ou menos imagens por minuto, altere aqui :D
	sleep 15;
	
done
