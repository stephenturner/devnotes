# Get the miniconda installer & run it. Log out, log in, conda now in path.
# See miniconda docs at https://conda.io/miniconda.html
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh

# Add bioconda channels. See docs at https://bioconda.github.io/
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda


# Create a conda environment named "wgs" that includes all the tools you need.
# See docs at https://conda.io/docs/using/envs.html
# conda create --name wgs bwa sambamba samblaster freebayes bcftools samtools vt bedtools vcftools ensembl-vep snpeff fastqc vcfanno vcflib
