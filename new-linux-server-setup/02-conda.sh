# Get the miniconda installer & run it. Log out, log in, conda now in path.
# See miniconda docs at https://conda.io/miniconda.html
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Add bioconda channels. See docs at https://bioconda.github.io/
conda config --add channels defaults
conda config --add channels bioconda
conda config --add channels conda-forge

# Update conda
conda update -n base conda

# Base environment
conda install -y numpy scipy scikit-learn matplotlib pandas ipython jupyter

# Enable bash kernel for jupyter notebook
# pip install bash_kernel
# python -m bash_kernel.install

# Other environments
# conda create -y --name ngs fastqc fastq-screen fastx_toolkit multiqc sra-tools entrez-direct picard bedtools htslib samtools bcftools vcftools bwa minimap2 bowtie2 blast biopython nextflow snpeff mash diamond strelka qualimap
conda create -y --name ngs fastx_toolkit sra-tools entrez-direct picard bedtools htslib samtools bcftools vcftools bwa blast snpeff mash diamond