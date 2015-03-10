#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 20 
#SBATCH --time=02:00:00
#SBATCH --mem=120GB
#SBATCH -A uvabx
$1
