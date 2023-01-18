#!/bin/bash

#SBATCH --job-name=augustus_duna
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/augustus-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/augustus-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load conda
conda activate augustus-3.5.0

### Constants
wd="/scratch/students/hummer/SCCourse/"

### Exectue
augustus --strand=both --species=chlamy2011 --gff3=on --genemodel=complete ${wd}data/ncbi_dataset/data/GCA_002284615.2/GCA_002284615.2_Dunsal1_v._2_genomic.fna > ${wd}/results/map/augustus.gff
