#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=ichksum-rdms
#SBATCH --output=ichksum-rdms-%j.log
#SBATCH --mem=200MB


# Example on Peregrine Cluster #
# 1. Login to Peregrine
# 2. cd /scratch/$USER/
# 3. sbatch ichksum-rdms.sh LIMS25133
# Pedro Santos Neves - p.m.santos.neves@rug.nl - 2022


data_name=$1

ichksum -far /rug/home/SW_genomics/${data_name}/
