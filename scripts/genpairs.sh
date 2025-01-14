#!/bin/bash

TNUM=$1

FNUM=$2

tricensus -t=$TNUM -i -p ~/tmpp/tripairs_${TNUM}.dat

date >> ~/log.txt
echo "tripairs_${TNUM}.dat generation complete" >> ~/log.txt

python ~/python/split_file.py --input ~/tmpp/tripairs_${TNUM}.dat --output ~/tmpp/tripairs_${TNUM} --num $FNUM
