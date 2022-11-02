#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=ul-rdms
#SBATCH --output=ul-rdms-%j.log
#SBATCH --mem=2GB


# Example on Peregrine Cluster #
# 1. Login to Peregrine
# 2. cd /scratch/$USER/
# 3. sbatch ul-rdms.sh LIMS25133
# Pedro Santos Neves - p.m.santos.neves@rug.nl - 2022


data_name=$1
cd /scratch/$USER/

iput -Pr -f -X restart.file.up-${data_name} --retries 50 /scratch/$USER/leeds-dl/${data_name}/ /rug/home/SW_genomics
