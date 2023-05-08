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
source $HOME/venv/bin/activate
python3 -u src/picai_baseline/unet/train.py \
  --weights_dir='../../data/output/results/UNet/weights/' \
  --overviews_dir='../../data/output/results/UNet/overviews/' \
  --folds 0 1 2 3 4 --max_threads 6 --enable_da 1 --num_epochs 250 \
  --validate_n_epochs 1 --validate_min_epoch 0 \
  --num_classes 5