## Install bedtools
# become root and navigate to the target directory
sudo su
cd /usr/local/bin
# get the statically linked binary
wget https://github.com/arq5x/bedtools2/releases/download/v2.29.2/bedtools.static.binary
# rename it and make executable
mv bedtools.static.binary bedtools
chmod a+x bedtools

## Install samtools
# become root
sudo su
cd /root
# Get and unpack the source
wget https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2
tar xjf samtools-1.10.tar.bz2
cd samtools-1.10
# if you don't care about colorful tview, configure without ncurses-devel
./configure --prefix=/usr/local/ --without-curses
# compile and install to /usr/local/bin and /usr/local/share/man
make
make install

## Install bcftools
# become root
sudo su
cd /root
# Get and unpack the source
wget https://github.com/samtools/bcftools/releases/download/1.10.2/bcftools-1.10.2.tar.bz2
tar xjf bcftools-1.10.2.tar.bz2
cd bcftools-1.10.2
# configure and install
./configure --prefix=/usr/local/
make
make install

## Install htslib
# become root
sudo su
cd /root
# Get and unpack the source
  wget https://github.com/samtools/htslib/releases/download/1.10.2/htslib-1.10.2.tar.bz2
  tar xjf htslib-1.10.2.tar.bz2
  cd htslib-1.10.2
# configure and install
  ./configure --prefix=/usr/local
  make
  make install