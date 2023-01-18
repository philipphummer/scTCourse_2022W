#!/bin/bash

#SBATCH --job-name=cd-hit_isoforms
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/cd-hit_isoforms-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/cd-hit_isoforms-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load cdhit
module load transdecoder
module list


### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia"
outFile="${wd}/clustered.fasta"
outTransdec="${wd}/decoded"

### Execution
echo "cd-hit-est -i ${wd}/GGWE01.renamed.fasta -o ${outFile} -c 1 -T 8 -d 50 -aS 1"
cd-hit-est -i ${wd}/GGWE01.renamed.fasta -o ${outFile} -c 1 -T 8 -d 50 -aS 1
echo "TransDecoder.LongOrfs -t ${outFile} -S -O ${outTransdec}"
TransDecoder.LongOrfs -t ${outFile} -S -O ${outTransdec}
echo "TransDecoder.Predict -t ${outFile} --single_best_only -O ${outTransdec}"
TransDecoder.Predict -t ${outFile} --single_best_only -O ${outTransdec}
