#!/bin/bash

# Stream data from ENA. See blog post here:
# http://nxn.se/post/146066712225/streaming-rna-seq-data-from-ena

if [ "$#" -ne 1 ]; then
    echo "Usage: stream_ena <accession[_1/2].fastq>"
    echo "Example (SE): stream_ena SRR3185782.fastq | head -n 12"
    echo "Example (PE): stream_ena SRR1274127_1.fastq | head -n 12"
    exit 1
fi

fastq="$1"

prefix=ftp://ftp.sra.ebi.ac.uk/vol1/fastq

accession=$(echo $fastq | tr '.' '_' | cut -d'_' -f 1)

dir1=${accession:0:6}

a_len=${#accession}
if (( $a_len == 9 )); then
    dir2="";
elif (( $a_len == 10 )); then
    dir2=00${accession:9:1};
elif (( $a_len == 11)); then
    dir2=0${accession:9:2};
else
    dir2=${accession:9:3};
fi

url=$prefix/$dir1/$dir2/$accession/$fastq.gz

curl --keepalive-time 4 -s $url | zcat
