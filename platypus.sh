FILE=${1:-/dev/stdin}
if [ $# -gt 1 ];then
    echo "Syntax: platypus [file]" 1>&2
    exit 1
fi
if [[ ! -f $FILE || ! -r $FILE ]];then
    echo "platypus: could not read file \""$FILE"\"" 1>&2
    exit 2
fi
cat $FILE | while read line ; do
    sub=$(echo $line | cut -d ' ' -f1)
    woord=$(echo $line | cut -d ' ' -f2)
    noemer=$(echo $sub | cut -d '/' -f2)
    teller=$(echo $sub | cut -d '/' -f1 )
    woordlengte=$(echo ${#woord})
    maal=$((${#woord}/$noemer))
    nieuweteller=$((maal*teller))
    


    if [[ $woordlengte -ne ${noemer} ]];then
        if [[ "${teller:0:1}" == "-" ]];then
                echo -n "${woord:$nieuweteller}"
            else
                echo -n "${woord:0:$nieuweteller}"
            fi
            
    else
            if [[ "${teller:0:1}" == "-" ]];then
                echo -n "${woord:$teller}"
            else
                echo -n "${woord:0:$teller}"
            fi
    fi

done
echo ""

