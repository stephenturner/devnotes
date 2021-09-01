#!/bin/bash

cd ${HOME}/bin
wget https://github.com/samtools/bcftools/releases/download/1.13/bcftools-1.13.tar.bz2
tar -xvjf bcftools-1.13.tar.bz2
ln -s bcftools-1.13/ bcftools
cd bcftools
make

echo 'export PATH="${HOME}/bin/bcftools:$PATH"' >> ${HOME}/.bash_profile
echo 'export BCFTOOLS_PLUGINS="${HOME}/bin/bcftools/plugins"' >> ${HOME}/.bash_profile
