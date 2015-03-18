#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 2 
#SBATCH --time=12:00:00
#SBATCH --mem=12GB
#SBATCH -A uvabx
$1
