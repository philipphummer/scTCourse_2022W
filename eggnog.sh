#!/bin/bash

#SBATCH --job-name=protein_eggnog
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --time=5:0:0
#SBATCH --partition=basic
#SBATCH --output=/scratch/students/hummer/SCCourse/logs/protein_eggnog-%j.log
#SBATCH --error=/scratch/students/hummer/SCCourse/logs/protein_eggnog-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=philipp.hummer98@gmail.com

### Environments
module load conda
module list
conda activate eggnog-mapper-2.1.9

### Constants
wd="/scratch/students/hummer/SCCourse/data/tripedalia/protein"
od="${wd}/eggnog"
inFasta="/scratch/molevo/jmontenegro/SCCourse/data/refs/GHAQ01.fasta.transdecoder.pep"
data="/scratch/mirror/eggnog-mapper/2.1.9"

### Execution

echo "Started at `date`"

echo "mkdir ${od}"
mkdir ${od}

echo "emapper.py --cpu 16 -i ${inFasta} --itype proteins --data_dir ${data} -m diamond --go_evidence all --output GHAQ01_eggnog --output_dir ${od}"
emapper.py --cpu 16 -i ${inFasta} --itype proteins --data_dir ${data} -m diamond --go_evidence all --output GHAQ01_eggnog --output_dir ${od}

echo "Finished at `date`"
