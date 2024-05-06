#!/bin/bash

#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J trimming
#SBATCH --mail-type=ALL
#SBATCH --mail-user okbit-fishale.desale.5900@student.uu.se

module load bioinfo-tools 
module load trimmomatic

export TRIMMOMATIC=/sw/bioinfo/trimmomatic/0.39/snowy

input=/home/bigdat24/Gendata24/raw_data/DNA/
output=/home/bigdat24/Gendata24/output/trimmomatic/

mkdir -p $output





# Run Trimmomatic command
java -jar $TRIMMOMATIC/trimmomatic-0.39.jar PE -threads 2 -phred64 \
	-basein $input
	-baseout $output/dna_1_trimmed.fast.fq.gz
	ILLUMINACLIP:$TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:36
