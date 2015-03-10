#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 1 
#SBATCH --time=96:00:00
#SBATCH --mem=6GB
#SBATCH -A uvabx
$1
