#!/bin/bash

#SBATCH --job-name=busco-thresholds
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/busco-thresholds-%j-%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/busco-thresholds-%j-%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load conda
module list
conda activate busco-5.4.4

### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia"
list=( 0.95 0.97 0.99 )
od="${wd}/busco"

###Variable
ico="${list[${SLURM_ARRAY_TASK_ID}]}" #mit oder ohne innerer curly brackets?
file="${wd}/decoded/dedup_clustered.${ico}.fasta"


### Execution
echo "mkdir -p ${od}"
mkdir -p ${od}

echo "cd ${od}"
cd ${od}

echo "busco -f -i ${file} -l metazoa -o ${od}/tripedalia_metazoa.${ico} -l metazoa -m tran -c 16 --download_path /scratch/students/hummer/SCCourse/scripts"
busco -f -i ${file} -l metazoa -o ${od}/tripedalia_metazoa.${ico} -l metazoa -m tran -c 16 --download_path /scratch/students/hummer/SCCourse/scripts

#/scratch/students/hummer/SCCourse/data/tripedalia
