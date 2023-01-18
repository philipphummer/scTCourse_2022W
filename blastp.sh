#!/bin/bash

#SBATCH --job-name=protein_blastp
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/protein_blastp-%j_%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/protein_blastp-%j_%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### Environment
module load ncbiblastplus
module list

#### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia/protein"
od="${wd}/blastp"
chunks=( ${wd}/../ref_transcriptoms/chunk*.fasta )
nd_db="/scratch/mirror/ncbi/2022-12-17/nr"
taxids="/scratch/molevo/jmontenegro/nvectensis/scripts/metazoa.taxids"

### Variables
inFasta="${chunks[${SLURM_ARRAY_TASK_ID}]}"
outFile="${od}/chunk_${SLURM_ARRAY_TASK_ID}.metazoa.blastp.tsv"
ref="${refs[${SLURM_ARRAY_TASK_ID}]}"
idxName="$(basename ${ref})"


#### Execution

echo "mkdir ${od}"
mkdir ${od}

echo "blastp -query ${inFasta} -db ${nd_db} -out ${outFile} -num_threads 8 -evalue 1e-5 -taxidlist ${taxids} -outfmt 6 qsequid sseqid ssciname salltitles evalue bitscore glen slen length "
blastp -query ${inFasta} -db ${nd_db} -out ${outFile} -num_threads 8 -evalue 1e-5 -taxidlist ${taxids} -outfmt "6 qsequid sseqid ssciname salltitles evalue bitscore glen slen length" 

#thus far I have only run 0 and 1;