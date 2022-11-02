#!/bin/bash
#SBATCH --time=02:00:00
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=dl-rdms
#SBATCH --output=dl-rdms-%j.log
#SBATCH --mem=1GB


# Example on Peregrine Cluster #
# 1. Login to Peregrine
# 2. cd /scratch/$USER/
# 3. sbatch dl-rdms.sh LIMS25133
# Pedro Santos Neves - p.m.santos.neves@rug.nl - 2022


data_name=$1
cd /scratch/$USER/
mkdir -p SW_genomics/${data_name}/Raw/

iget -KPr -X restart.file-${data_name} --retries 10 /rug/home/SW_genomics/${data_name}/Raw/ /scratch/$USER/SW_genomics/${data_name}/
