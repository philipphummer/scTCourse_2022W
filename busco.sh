#!/bin/bash

#SBATCH --job-name=busco
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/busco-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/busco-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load conda
conda activate busco-5.4.4


### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia"

### Execution
echo"busco -i ${wd}/GGWE01.fasta -o ${wd}/tripedalia_metazoa -l metazoa -m tran -c 16 --download_path /scratch/students/hummer/SCCourse/scripts -f"
busco -i ${wd}/GGWE01.renamed.fasta -o ${wd}/busco/tripedalia_metazoa -l metazoa -m tran -c 16 --download_path /scratch/students/hummer/SCCourse/scripts -f