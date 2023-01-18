#!/bin/bash

#SBATCH --job-name=star_index
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=10G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/indexSTAR-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/indexSTAR-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load star/2.7.10b
module list

###Variables
refDir="/scratch/students/hummer/SCCourse/data/ref/dunasalina_STAR"
refFasta="/scratch/students/hummer/SCCourse/data/ncbi_dataset/data/GCA_002284615.2/GCA_002284615.2_Dunsal1_v._2_genomic.fna"

###Exectution
echo "Started at `date`"
STAR --runThreadN 8 --runMode genomeGenerate --genomeDir=${refDir} --genomeFastaFiles=${refFasta} --genomeSAindexNbases 13

echo "STAR --runThreadN 8 --runMode genomeGenerate --genomeDir=${refDir} --genomeFastaFiles=${refFasta} --genomeSAindexNbases 13
"
echo "Finished at `date`"
