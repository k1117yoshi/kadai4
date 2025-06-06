#!/bin/bash

#最大公約数シェルスクリプト

#エラー終了用関数
function error(){
	echo "ERROR:$1" 1>&2
	exit 1
}

#バリデーションチェック
#引数の数が不正
if [ $# -lt 2 ] ; then
	error "引数が少ない"
elif [ $# -gt 2 ] ; then
	error "引数が多い"
fi

#引数の種類が不正
if [[ ! "$1" =~ ^[0-9]+$ ]] ; then
	error "引数１が自然数でない"
elif [[ ! "$2" =~ ^[0-9]+$ ]] ; then
	error "引数２が自然数でない"
fi

#ユークリッドの互除法
num1=$1
num2=$2

if [ $num1 -eq $num2 ] ; then
       	echo $num1
	exit0
fi

while : ; do
	if [ $num1 -gt $num2 ] ; then
		remainder=$(( num1 % num2 ))
		if [ $remainder -eq 0 ] ; then
		        echo $num2
	       		exit 0
	 	fi
		num1=$num2
		num2=$remainder
	else
		remainder=$(( num2 % num1 ))
                if [ $remainder -eq 0 ] ; then
                        echo $num1
                        exit 0
                fi
                num2=$num1
		num1=$remainder
	fi
done
