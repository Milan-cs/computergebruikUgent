#! /usr/bin/bash

syntax() {
        echo "Syntax: christmas [-m] [-n integer] [-s integer] FILE" 1>&2
}
m=0
n=1
s=15
while getopts ":mn:s:" opt ; do
        case $opt in
                m)
                        m=1 ;;
                n)
                    if [[ $OPTARG =~ ^[+-]?[1-9][0-9]*$ ]] ; then
                                n=$OPTARG
                        else
                            syntax
                            exit 2
                        fi ;;
                        
                s)
                        if [[ $OPTARG =~ ^[+-]?[1-9][0-9]*$ ]] ; then
                                s=$OPTARG
                        else
                                syntax
                                exit 3
                        fi ;;
                \?)
                        syntax
                        exit 1
        esac
done
shift $((OPTIND - 1))

if [ $# -ne 1 ];then
    syntax
    exit 4
fi

#move #i directories up.
up() {
    i=${1:-1}
    while ((i--)); do
        cd ..
    done
}

bestand2=$(echo $1 | cut -d '/' -f3)
bestand=$1

COUNTER=0
while [[ $COUNTER -lt $s ]];do
if [[ $COUNTER -eq 0 ]];then
    newdir=$(dirname $bestand)
    cat $bestand | head -3 | tail -2
    cd $newdir
    head -$n $bestand2 > file.txt
else
    head -$n $newbestand > file.txt
fi


token=$(cat file.txt | head -1 | cut -d ' ' -f2)
newbestand=$(cat file.txt | head -1 | cut -d ' ' -f3)
rm file.txt



if [[ $token =~ ^[1-9]$ ]];then
    up $token
elif [[ $token =~ ^0$ ]];then
        cd .
else
    if [[ ! -d "$token" ]];then
        exit 0
    else
        cd ./$token
    fi
fi

if [[ $m -eq 1 ]];then
    cat $newbestand | head -3 | tail -2 | rev
else
    cat $newbestand | head -3 | tail -2
fi

let COUNTER=COUNTER+1
done
exit 0











