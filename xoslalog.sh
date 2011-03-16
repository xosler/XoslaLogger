#!/bin/bash
#
# 
# tira um screenshot com o scrot
# Não marque o check box "executar no terminal"
# Lembre: chmod +x neste arquivo
# salvara em uma pasta /root/logs/ano/mes/dia/imagens



while [ true ]; do

	#cria a estrutura de pastas no esquema
	# /root/logs/ano/mes/dia/imagens
	
	ano=`date '+%y'`
	mes=`date '+%m'`
	dia=`date '+%d'`
	imagens="imagens"
		
	pasta="logs"
	home="/root"	
	
	diretorio=$home/$pasta/$ano/$mes/$dia/$imagens	
	
	if [ ! -e $diretorio ]; then
		mkdir -p  $diretorio
	fi
		
	# até aqui é os esquemas de criar pastas
	
	
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
	scrot $file;
	sleep 15;
	
done
