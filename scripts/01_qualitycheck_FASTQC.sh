#!/bin/bash -l
#SBATCH -A uppmax2024-2-7
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J fastqc
#SBATCH --mail-type=ALL
#SBATCH --mail-user okbit-fishale.desale.5900@student.uu.se

module load bioinfo-tools
module load FastQC

output=/home/bigdat24/Gendata24/output/fastqc/
input=/home/bigdat24/Gendata24/raw_data/

# RNA 
rna_in=$input/RNA

# DNA
dna_in=$input/DNA

mkdir -p $output/DNA $output/RNA

fastqc -o $output/RNA -t 2 rna_in/*
fastqc -o %output/DNA -t 2 dna_in/*
