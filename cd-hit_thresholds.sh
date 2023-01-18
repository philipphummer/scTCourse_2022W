#!/bin/bash

#SBATCH --job-name=cd-hit-thresholds
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/cd-hit-thresholds-%j-%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/cd-hit-thresholds-%j-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load cdhit
module list

### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia"
icos=( 0.95 0.97 0.99 )
outTransdec="${wd}/decoded"

###Variable
pos=$(( ${SLURM_ARRAY_TASK_ID} - 1 ))
ico="${icos[$pos]}"


### Execution
echo "cd-hit-est -i ${outTransdec}/clustered.fasta.transdecoder.cds -o ${outTransdec}/dedup_clustered.${ico}.fasta -aL 0.9 -aS 0.9 -T 8 -d 50 -c ${ico}"
cd-hit-est -i ${outTransdec}/clustered.fasta.transdecoder.cds -o ${outTransdec}/dedup_clustered.${ico}.fasta -aL 0.9 -aS 0.9 -T 8 -d 50 -c ${ico}
