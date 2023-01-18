#!/bin/bash

#SBATCH --job-name=downloadSRA
#SBATCH --nodes=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/downloadSRA-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/downloadSRA-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### ENVIRONMENT
module load sratoolkit
module list

### CONSTANTS
wd="/scratch/students/hummer/SCCourse"
od="${wd}/data/reads"
list=( SRR14800614 )

### VARIABLE
pos=$(( ${SLURM_ARRAY_TASK_ID}-1 ))
acc=${list[$pos]}

### EXECUTION
echo "Started at `date`"

echo "fasterq-dump ${acc} -O ${od} -e 4"
fasterq-dump ${acc} -O ${od} -e 4

echo "Finished at `date`"
