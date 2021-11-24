# Compile and install htslib, bcftools, samtools 1.9 to home directory

# Set up dirs where stuff will be installed
mkdir -p ${HOME}/bin/htslib
mkdir -p ${HOME}/bin/bcftools
mkdir -p ${HOME}/bin/samtools

# Make a dir to build
mkdir -p ${HOME}/tmp

# htslib
cd ${HOME}/tmp
wget https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2
tar xjf htslib-1.9.tar.bz2
cd htslib-1.9
./configure --prefix=${HOME}/bin/htslib
make -j4
make install

# bcftools
cd ${HOME}/tmp
wget https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2
tar xjf bcftools-1.9.tar.bz2
cd bcftools-1.9
./configure --prefix=${HOME}/bin/bcftools
make -j4
make install

# samtools
cd ${HOME}/tmp
wget https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2
tar xjf samtools-1.9.tar.bz2
cd samtools-1.9
./configure --prefix=${HOME}/bin/samtools --without-curses
make -j4
make install

# add to path
echo 'PATH=${HOME}/bin/htslib/bin:${HOME}/bin/bcftools/bin:${HOME}/bin/samtools/bin:$PATH' >> ${HOME}/.bashrc
echo 'BCFTOOLS_PLUGINS=${HOME}/bin/bcftools/libexec/bcftools' >> ${HOME}/.bashrc
