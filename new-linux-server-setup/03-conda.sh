# Get the miniconda installer & run it. Log out, log in, conda now in path.
# See miniconda docs at https://conda.io/miniconda.html
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Add bioconda channels. See docs at https://bioconda.github.io/
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda

# Base environment
conda install numpy scipy scikit-learn matplotlib pandas jupyter

# Other environments
conda create -y --name ngs    fastqc fastq-screen fastx_toolkit multiqc sratools picard bedtools htslib samtools bcftools vcftools bwa bowtie2 blast biopython mummer mash 
conda create -y --name rnaseq fastqc fastq-screen fastx_toolkit multiqc sratools picard bedtools htslib samtools bcftools star salmon kallisto subread