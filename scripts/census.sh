#!/bin/bash

TNUM=$1

FNUM=${2:-"10"}

DEBUG=${3:-"false"}

echo "" >> ~/log.txt
echo "" >> ~/log.txt
date >> ~/log.txt
echo "census.sh ${TNUM} ${FNUM} start" >> ~/log.txt

echo "" >> ~/log.txt
bash ~/scripts/genpairs.sh $TNUM $FNUM
echo "" >> ~/log.txt

for ((i=0; i<FNUM; i++)); do
    if [ "$DEBUG" = "true" ]; then
        sbatch --job-name=paircensus_${TNUM}_$i --time=10-00:00:00 --error=./tmp_error/error_%j.txt --export=ALL,TNUM=$TNUM,i=$i ~/scripts/paircensus.sh
    else
        sbatch --job-name=paircensus_${TNUM}_$i --time=10-00:00:00 --export=ALL,TNUM=$TNUM,i=$i ~/scripts/paircensus.sh 
    fi
done