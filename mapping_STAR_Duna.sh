#!/bin/bash

#SBATCH --job-name=star_mapping
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/mappingSTAR-%j_%A.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/mappingSTAR-%j_%A.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load star/2.7.10b
module list

###Constants
wd="/scratch/students/hummer/SCCourse"
reads1=( ${wd}/data/reads/*_1.fastq ) #creates a list of am files that exist in the results
resDir="${wd}/results/map"

###Variables
refDir="/scratch/students/hummer/SCCourse/data/ref/dunasalina_STAR"
refFasta="/scratch/students/hummer/SCCourse/data/ncbi_dataset/data/GCA_002284615.2/dunasalina_transcripts.fa"
read1=${reads1[$pos]}
read2="${read1/_1./_2.}"
prefix=`basename ${read1}`
prefix="${resDir}/${prefix%.fastq}"

###Exectution
echo "Started at `date`"
mkdir -p ${resDir}

echo "STAR --runThreadN 16 --genomeDir ${refDir} --readFilesIn ${read1} ${read2} --outFileNamePrefix ${prefix}"
STAR --runThreadN 16 --genomeDir ${refDir} --readFilesIn ${read1} ${read2} --outFileNamePrefix ${prefix}

echo "SSTAR --runThreadN 8 --genomeDir=${refFasta} --readFilesIn=${refFasta}"
echo "Finished at `date`"
