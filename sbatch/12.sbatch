#!/bin/bash
#SBATCH -p serial
#SBATCH -N 1 
#SBATCH -n 12 
#SBATCH --time=12:00:00
#SBATCH --mem=72GB
#SBATCH -A uvabx
$1
