#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 12 
#SBATCH --time=02:00:00
#SBATCH --mem=72GB
#SBATCH -A uvabx
$1
