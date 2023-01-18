#!/bin/bash

#SBATCH --job-name=protein_interpro
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/protein_interpro-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/protein_interpro-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### Environments
module load conda
conda activate eggnog-mapper-2-1-9

### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia/protein"
inFasta="/scratch/molevo/jmontenegro/SCCourse/data/refs/GHAQ01.fasta.transdecoder.pep"
ips="/scratch/mirror/interpro/interproscan-5.60-92.0/interproscan.sh"


### Execution

echo "Started at `date`"

echo "bash ${ips} -i ${inFasta} -cpu 16 -d ${wd} -f tsv,gff3 -b tripedalia_ghaq01 -t p -goterms -pa"
bash ${ips} -i ${inFasta} -cpu 16 -f tsv,gff3 -b ${wd}/tripedalia_ghaq01 -t p -goterms -pa


echo "Finished at `date`"
