#!/bin/bash

#SBATCH --job-name=sra_download
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/sra_download-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/sra_download-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load sratoolkit
module list

### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia"

### EXECUTE

#featureCounts -a ${ref}/genomic.gtf  -o ${td}/map/counts.duna.stv ${td}/map/SRR14800614_1Aligned.out_sorted_filtered.bam
#featureCounts -a ${td}/genomic.gtf  -o ${td}/SRR14800614_1Aligned.out_sorted_filtered.bam

echo"fasterq-dump SRR7791344 -O ${wd}"
fasterq-dump SRR7791344 -O ${wd} 


