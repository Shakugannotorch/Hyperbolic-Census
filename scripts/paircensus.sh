#!/bin/bash

#SBATCH --partition m
#SBATCH --cpus-per-task=20
#SBATCH --output=/dev/null 
#SBATCH --error=/dev/null ...%A_%a

tricensus -h -s -P --threads=20 ~/tmpdata/tricensus_${TNUM}_${i}.dat < ~/tmpp/tripairs_${TNUM}_${i}.dat

date >> ~/log.txt
echo "tricensus_${TNUM}_${i}.dat is completed" >> ~/log.txt