#!/bin/bash

#SBATCH --job-name=tripedalia_bowtie
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/tripedalia_bowtie-%j_%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/tripedalia_bowtie-%j_%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load bowtie2
module load samtools
module list

### Constants

wd="/scratch/students/hummer/SCCourse/data/tripedalia"
refs=( ${wd}/ref_transcriptoms/*.fasta ) #list of references
read="${wd}/SRR7791344.fastq"


###Variables
ref="${refs[${SLURM_ARRAY_TASK_ID}]}"
idxName="$(basename ${ref})"
idxName="${idxName%.*}"
outSam="${wd}/bowtie/SRR7791344_${idxName}.sam"
sortedBam="${outSam%.sam}.sorted.bam"

###Exectution
echo "Started at `date`"

echo "cd ${wd}"
cd ${wd}

echo "mkdir bowtie"
mkdir bowtie

echo "bowtie2-build --threads 16 ${ref} ${idxName}"
bowtie2-build --threads 16 ${ref} ${idxName} #for indexing

echo "bowtie2 -x ${idxName} -U ${read} -p 16 --fast-local -S ${outSam}"
bowtie2 -x ${idxName} -U ${read} -p 16 --fast-local -S ${outSam} #for alignment

echo "samtools view -u@ 4 ${outSam} | samtools sort -@ 16 -o ${sortedBam} -"
samtools view -u@ 4 ${outSam} | samtools sort -@ 16 -o ${sortedBam} -

echo "samtools flagstat ${sortedBam}"
samtools flagstat ${sortedBam}

echo "Finished at `date`"
