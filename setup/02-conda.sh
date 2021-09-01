# Get the miniconda installer & run it. Log out, log in, conda now in path.
# See miniconda docs at https://conda.io/miniconda.html
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
# Yes to conda init question
conda config --set auto_activate_base false

# Add bioconda channels. See docs at https://bioconda.github.io/
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# Update conda
conda update -n base conda

# Base environment
conda activate base
conda install mamba
conda deactivate

# standard ngs toolkit
# conda create -y --name ngs fastqc fastq-screen fastx_toolkit multiqc sra-tools entrez-direct picard bedtools htslib samtools bcftools vcftools bwa minimap2 bowtie2 blast biopython nextflow snpeff mash diamond strelka qualimap vt
mamba create -y --name ngs fastx_toolkit sra-tools entrez-direct picard bedtools htslib=1.13 samtools=1.13 bcftools=1.13 tabix vcftools bwa blast snpeff vt varscan plink2 akt minimap2

# https://github.com/Illumina/GTCtoVCF#requirements
mamba create --name gtc2vcf numpy=1.11.2 bcftools=1.13 pysam=0.9.0 pyvcf=0.6.8
# mamba update --all
