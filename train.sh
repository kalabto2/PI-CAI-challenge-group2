#!/bin/bash
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=18
#SBATCH --gpus=1
#SBATCH --mem=64G
#SBATCH -t 72:00:00
module load 2021
module load Python/3.9.5-GCCcore-10.3.0
#Execute program located in $HOME
source $HOME/venv3/bin/activate

python3 -u ../ohuvar/ISMI_PICAI_Team2_gc_algorithm/src/picai_baseline/unet/train.py \
  --weights_dir='workdir/results/UNet/weights/' \
  --overviews_dir='workdir/results/UNet/overviews/Task2201_picai_baseline/' \
  --folds 0 1 2 3 4 --max_threads 6 --enable_da 1 --num_epochs 250 \
  --validate_n_epochs 1 --validate_min_epoch 0
