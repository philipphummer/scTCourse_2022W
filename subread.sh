#!/bin/bash

#SBATCH --job-name=featurecount_duna
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/subread-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/subread-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load subread
module list

### Constants
wd="/scratch/students/hummer/SCCourse"
#ref="${wd}data/ncbi_dataset/data/GCA_002284615.2"

td="${wd}/results/map"

#featureCounts -a ${ref}/genomic.gtf  -o ${td}/map/counts.duna.stv ${td}/map/SRR14800614_1Aligned.out_sorted_filtered.bam
featureCounts -a ${td}/genomic.gtf  -o ${td}/SRR14800614_1Aligned.out_sorted_filtered.bam
echo"featureCounts -a ${td}/genomic.gtf  -o ${td}/SRR14800614_1Aligned.out_sorted_filtered.bam"