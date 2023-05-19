#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --gpus=1
#SBATCH --mem=64G
#SBATCH -t 1:00:00
module load 2021
module load Python/3.9.5-GCCcore-10.3.0
#Execute program located in $HOME
source $HOME/venv3/bin/activate

python3 ../ohuvar/ISMI_PICAI_Team2_gc_algorithm/src/picai_baseline/prepare_data.py