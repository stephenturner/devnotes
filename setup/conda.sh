# Install micromamba
curl micro.mamba.pm/install.sh | bash

# Put this in your ~/.mambarc
# channels:
#   - conda-forge
#   - bioconda
#   - defaults
# auto_activate_base: false
# ssl_verify: false

# snakemake (helpful to have pyprojroot)
micromamba create -y --name snakemake snakemake pyprojroot

# blast
micromamba create -n blast blast

# samtools
micromamba create -n samtools samtools htslib bcftools

# standard ngs toolkit
# mamba create -y --name ngs fastqc fastq-screen fastx_toolkit multiqc sra-tools entrez-direct picard bedtools htslib samtools bcftools vcftools bwa minimap2 bowtie2 blast biopython nextflow snpeff mash diamond strelka qualimap vt
# mamba create -y --name ngs fastx_toolkit sra-tools entrez-direct picard bedtools htslib=1.9 samtools=1.9 bcftools=1.9 bwa blast snpeff vt varscan plink2 akt minimap2
micromamba create -y -n ngs samtools htslib bcftools bwa blast minimap2 sra-tools
