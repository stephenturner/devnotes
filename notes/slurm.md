# SLURM notes

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
