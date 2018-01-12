# SLURM notes

## Resources

* Translation table: <http://slurm.schedmd.com/rosetta.pdf>
* Official SLURM docs: <http://slurm.schedmd.com/documentation.html>
* LLNL's SLURM FAQ: <https://computing.llnl.gov/linux/slurm/faq.html>
* Harvard's SLURM help: <https://rc.fas.harvard.edu/resources/running-jobs/>
* UVACSE: <http://uvacse.virginia.edu/user-info>
  * HPC Queues: <http://uvacse.virginia.edu/rivannas-queues>
  * HPC FAQ: <http://uvacse.virginia.edu/user-info/frequently-asked-questions>
  * HPC Modules: <http://uvacse.virginia.edu/user-info/modules>
  * SLURM help: <http://uvacse.virginia.edu/user-info/simple-linux-utility-resource-management-slurm>

## Running quick jobs with `srun`

Quickly run piped output through the scheduler using `srun`, requesting 1 node, 1 core, 1GB RAM per CPU, using the economy partition under the uvabx allocation:

```bash
echo "hostname" | xargs srun -p economy -N 1 -n 1 --time=00:05:00 --mem-per-cpu=1000 -A uvabx $1
```

Alternatively specify the total memory requirement and two cores, and append an `&` to the end so you don't have to wait for it to start:

```bash
echo "hostname" | xargs srun -p economy -N 1 -n 2 --time=00:05:00 --mem=2000 -A uvabx $1 &
```

Example, running [featureCounts](http://bioinf.wehi.edu.au/featureCounts/) on 4 cores:

```bash
echo "featureCounts -a genes.gtf -o counts.txt -pBT4 *.sam" | xargs srun -p economy -N1 -n4 --time=00:05:00 --mem-per-cpu=1000 -A uvabx $1 
```

Example piping find:

```bash
# Make some example data files
touch data{1,2,3}.txt

# Pipe this whole mess to |sh to submit
find *.txt | xargs -i echo "echo 'runThisCommand {} > {}.result.txt' | xargs srun -p economy --time=2:00:00 --mem=2000 -A uvabx $1 &"
# echo 'runThisCommand data1.txt > data1.txt.result.txt' | xargs srun -p economy --time=2:00:00 --mem=2000 -A uvabx  &
# echo 'runThisCommand data2.txt > data2.txt.result.txt' | xargs srun -p economy --time=2:00:00 --mem=2000 -A uvabx  &
# echo 'runThisCommand data3.txt > data3.txt.result.txt' | xargs srun -p economy --time=2:00:00 --mem=2000 -A uvabx  &
```

## Using an `sbatch` placeholder script

### Create placeholder sbatch scripts

First, create a placeholder sbatch script. E.g., using a single core:

**simple.sbatch**: 

```bash
#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 1 
#SBATCH --time=02:00:00
#SBATCH --mem-per-cpu=1000
#SBATCH -A uvabx
$1
```

Or multiple cores with total RAM specified (multiply n*6 to get optimal RAM, or RAM/6 to get optimal n):

**simple4c.sbatch**:

```bash
#!/bin/bash
#SBATCH -p economy
#SBATCH -N 1 
#SBATCH -n 4 
#SBATCH --time=12:00:00
#SBATCH --mem=24000
#SBATCH -A uvabx
CMD=$1
$($CMD);
```

### Run job with sbatch and the placeholder script

E.g., simple job to run the `hostname` command:

```bash
sbatch simple.sbatch hostname
```

Or using the featureCounts example above:

```bash
sbatch simple4c.sbatch "featureCounts -a genes.gtf -o counts.txt -pBT2 *.sam " 
```

## PBS to SLURM Translation

  . | **PBS** | **slurm**
--- | --- | ----
**command** | `qsub` | `sbatch`
**Threads** | `-l ncpus=4` | `-n 4`
**Memory** | `-l mem=4GB` | `--mem=4000`
**Walltime** | `-l walltime=24:00:00` | `-t 24:00:00`
**Specify partition** | `-q standard` | `-p economy`
**Specify allocation** | `-W group_list=uvabx` | `-A uvabx`
**Environment** | `-V` | `--get-user-env`
**Email type** | `-m bae` | `--mail-type=ALL`
**Email** | `-M user@host.com` | `--mail-user=user@host.com`
**stderr/stdout** | `-j oe` | (not necessary)

E.g. old PBS:

```bash
#Set up job parameters
THREADS="2"
MEM="4GB"
WORKINGDIR="/path/wd"
 
QSUB="qsub -l ncpus=$THREADS -l mem=$MEM -l walltime=2:00:00 -q standard -V -j oe -m bae -M user@host.com"

#Using it
echo "commands" | $QSUB
```

E.g. new SLURM: 

```bash
#Set up job parameters
THREADS="2"
MEM="4GB"
WORKINGDIR="/path/wd"
 

SBATCH="sbatch -n $THREADS --mem=$MEM -t 2:00:00 -p economy -A uvabx --get-user-env --mail-type=ALL --mail-user=user@host.com"

# Using it (first create a valid shell script)
cat jobscript.sh | $SBATCH
```
