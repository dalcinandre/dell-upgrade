#!/bin/sh
#

for i in $(ls *.BIN);
do
    echo -e "\E[00;33m$i\E[00;37m";
    ./$i -q -c > /dev/null
    Q=$?
    echo

    if [ $Q -ge 5 ]; then
        echo -e "\E[00;33mArquivo Incompativel... deletando \E[00;32m${i}\E[00;37m\n";
        rm -fr $i
    else
        echo -e "\E[00;33mAplicando arquivo \E[00;32m${i}\E[00;37m\n"
        ./$i -q
    fi
done
