#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=gelifes
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=sha256sum-leeds
#SBATCH --output=sha256sum-leeds-%j.log
#SBATCH --mem=400MB


# Example on Peregrine Cluster #
# 1. Login to Peregrine
# 2. cd /scratch/$USER/
# 3. sbatch sha256sum-leeds.sh LIMS25133
# Pedro Santos Neves - p.m.santos.neves@rug.nl - 2022

data_name=$1
cd /scratch/$USER/

find /scratch/$USER/leeds-dl/${data_name}/Raw/ -type f -exec sha256sum {} \; | sort > /scratch/$USER/${data_name}_sha556sum.lst
