#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 8
#SBATCH --time=12:00:00
#SBATCH --mem=48GB
#SBATCH -A uvabx
$1
