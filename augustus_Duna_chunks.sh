#!/bin/bash

#SBATCH --job-name=augustus_duna
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/augustus-%j_%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/augustus-%j_%A.err
#SBATCH --mail-type=NONE
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load conda
conda activate augustus-3.5.0
module load samtools

### Constants
wd="/scratch/students/hummer/SCCourse/"
ref="${wd}data/ncbi_dataset/data/GCA_002284615.2/"
td="${wd}/results/map/"
chunks=( ${ref}chunks/*.fasta )

###Variables
pos=$(( ${SLURM_ARRAY_TASK_ID} - 1 ))
chunk=${chunks[$pos]}
#chr="${chrs[pos]}"
#end="${ends[pos]}"

### Exectue
augustus --strand=both --species=chlamy2011 --gff3=on --genemodel=complete  ${chunk}> ${td}chunk_${pos}.gtf
