#!/bin/bash

IN=$1

OUT=$2

NUM_TASK=${3:-"400"}

echo "" >> ~/log.txt
echo "" >> ~/log.txt
date >> ~/log.txt
echo "paircensus_on_file.sh ${NUM_TASK} start" >> ~/log.txt

echo "" >> ~/log.txt
date >> ~/log.txt
echo "split_file.py --input ${IN} --output ${IN%.dat} --num ${NUM_TASK} start">>~/log.txt

python ~/python/split_file.py --input ${IN} --output ${IN%.dat} --num ${NUM_TASK}

for ((i=0; i<NUM_TASK; i++)); do
    sbatch --job-name=paircensus_on_file_$i --time=7-00:00:00 --export=ALL,IN=$IN,OUT=$OUT,i=$i ~/scripts/paircensus.sh 
done
