#!/bin/bash

#SBATCH --partition m
#SBATCH --output=/dev/null 
#SBATCH --error=/dev/null

tricensus -h -s -P ${OUT}_${i}.dat < ${IN%.dat}_${i}.dat

date >> ~/log.txt
echo "${OUT##*/}_${i}.dat is completed" >> ~/log.txt