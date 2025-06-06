#!/bin/bash

tmp=/tmp/$$
echo "ERROR:引数が少ない" > $tmp-args-few
echo "ERROR:引数が多い" > $tmp-aegs-many
echo "ERROR:引数１が自然数でない" > $tmp-arg1-notnum
echo "ERROR:引数２が自然数でない" > $tmp-arg2-notnum

ERROE_EXIT(){
	echo "$1" >&2
	rm -f $tmp-*
	exit 1
}

./script.sh 1 2> $tmp-ans && ERROR_EXIT "ERROE:引数が少ないのにエラーとならない"
diff $tmp-ans $tmp-args-few || ERROE_EXIT "ERROR:引数が少ないエラー出力が不正"
echo "引数が少ないクリア"

./script.sh 1 2 3 2> $tmp-ans && ERROR_EXIT "ERROE:引数が多いのにエラーとならない"
diff $tmp-ans $tmp-aegs-many || ERROE_EXIT "ERROR:引数が多いエラー出力が不正"
echo "引数が多いクリア"

./script.sh hoge 1 2> $tmp-ans && ERROR_EXIT "ERROE:引数1が自然数ではないのにエラーとならない"
diff $tmp-ans $tmp-arg1-notnum || ERROE_EXIT "ERROR:引数1が自然数でないエラー出力が不正"
echo "引数１が自然数でないクリア"

./script.sh 1 -1 2> $tmp-ans && ERROR_EXIT "ERROE:引数2が自然数ではないのにエラーとならない"
diff $tmp-ans $tmp-arg2-notnum || ERROE_EXIT "ERROR:引数2が自然数でないエラー出力が不正"
echo "引数２が自然数でないクリア"

./script.sh 12 16 2> $tmp-ans || ERROR_EXIT "ERROE:正常に処理されない"
echo "正常系試験クリア"

echo "END"
