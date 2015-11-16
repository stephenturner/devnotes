#!/bin/bash
#SBATCH -p serial
#SBATCH -N 1 
#SBATCH -n 10 
#SBATCH --time=12:00:00
#SBATCH --mem=60GB
#SBATCH -A uvabx

$1
