#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 4 
#SBATCH --time=12:00:00
#SBATCH --mem=24GB
#SBATCH -A uvabx
$1
