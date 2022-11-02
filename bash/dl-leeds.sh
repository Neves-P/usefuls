#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --partition=regular
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --job-name=dl-leeds
#SBATCH --output=dl-leeds-%j.log
#SBATCH --mem=800MB

data_name=$1
url=$2
echo "Downloading $data_name"
echo "Downloading from $url"

mkdir -m 777 -p /scratch/$USER/leeds-dl/${data_name}/Raw/
cd /scratch/$USER/leeds-dl/${data_name}/

wget -r --cut-dirs=2 -np -nH -nv -R "index.html*" ${url}
