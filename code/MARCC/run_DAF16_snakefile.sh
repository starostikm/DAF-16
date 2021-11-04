#!/bin/bash -l
#SBATCH --job-name=mRNA
#SBATCH --partition=express
#SBATCH --time=4:00:00
#SBATCH --mem=2G
#SBATCH --mail-type=end
#SBATCH --mail-user=mstaros1@jhu.edu

# uthor: Margaret R. Starostik
# Created: March 02, 2021
# Aim: this bash file executes the accompanying snakemake workflow


cd $SLURM_SUBMIT_DIR
source /home-3/mstaros1@jhu.edu/tools/conda3/etc/profile.d/conda.sh
conda activate python36

mkdir -p logs

snakemake --snakefile snakefile-aalessi2-133698 --jobname "{rulename}.{jobid}.snake" --verbose --stats snakefile-aalessi2-133698.stats --latency-wait 180 --rerun-incomplete -j --cores 100 --cluster="sbatch --partition={params.partition} --mem={params.mem} --time={params.time} --out logs/job_%j.out " >& snakefile-aalessi2-133698.log