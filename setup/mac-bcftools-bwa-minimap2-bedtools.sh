# Compile and install htslib, bcftools, samtools to home directory
VERSION_SAMTOOLS="1.17"

# Set up dirs where stuff will be installed
mkdir -p ${HOME}/bin/htslib
mkdir -p ${HOME}/bin/bcftools
mkdir -p ${HOME}/bin/samtools

# Make a dir to build
mkdir -p ${HOME}/tmp
cd ${HOME}/tmp

# htslib
cd ${HOME}/tmp
wget https://github.com/samtools/htslib/releases/download/${VERSION_SAMTOOLS}/htslib-${VERSION_SAMTOOLS}.tar.bz2
tar xjf htslib-${VERSION_SAMTOOLS}.tar.bz2
cd htslib-${VERSION_SAMTOOLS}
./configure --prefix=${HOME}/bin/htslib
make -j4
make install

# bcftools
cd ${HOME}/tmp
wget https://github.com/samtools/bcftools/releases/download/${VERSION_SAMTOOLS}/bcftools-${VERSION_SAMTOOLS}.tar.bz2
tar xjf bcftools-${VERSION_SAMTOOLS}.tar.bz2
cd bcftools-${VERSION_SAMTOOLS}
./configure --prefix=${HOME}/bin/bcftools
make -j4
make install

# samtools
cd ${HOME}/tmp
wget https://github.com/samtools/samtools/releases/download/${VERSION_SAMTOOLS}/samtools-${VERSION_SAMTOOLS}.tar.bz2
tar xjf samtools-${VERSION_SAMTOOLS}.tar.bz2
cd samtools-${VERSION_SAMTOOLS}
./configure --prefix=${HOME}/bin/samtools --without-curses
make -j4
make install

# add to path
echo 'PATH=${HOME}/bin/htslib/bin:${HOME}/bin/bcftools/bin:${HOME}/bin/samtools/bin:$PATH' >> ${HOME}/.bashrc
echo 'BCFTOOLS_PLUGINS=${HOME}/bin/bcftools/libexec/bcftools' >> ${HOME}/.bashrc



### BWA
VERSION_BWA="0.7.17"
cd ${HOME}/tmp
wget https://github.com/lh3/bwa/releases/download/v${VERSION_BWA}/bwa-${VERSION_BWA}.tar.bz2
tar xjf bwa-${VERSION_BWA}.tar.bz2
cd ${HOME}/tmp/bwa-${VERSION_BWA}
sed -i -e 's/<emmintrin.h>/"sse2neon.h"/' ksw.c
wget https://gitlab.com/arm-hpc/packages/uploads/ca862a40906a0012de90ef7b3a98e49d/sse2neon.h
make
mv bwa bwa.1 ${HOME}/bin
# man ~/bin/bwa.1

### Minimap2
cd ${HOME}/tmp
VERSION_MINIMAP2="2.24"
wget https://github.com/lh3/minimap2/releases/download/v${VERSION_MINIMAP2}/minimap2-${VERSION_MINIMAP2}.tar.bz2
tar xjf minimap2-${VERSION_MINIMAP2}.tar.bz2
cd minimap2-${VERSION_MINIMAP2}
make arm_neon=1 aarch64=1
mv minimap2 minimap2.1 ${HOME}/bin
# man ~/bin/minimap2.1


### BEDTOOLS
cd ${HOME}/bin
VERSION_BEDTOOLS="2.30.0"
wget https://github.com/arq5x/bedtools2/releases/download/v${VERSION_BEDTOOLS}/bedtools.static.binary
mv bedtools.static.binary bedtools

