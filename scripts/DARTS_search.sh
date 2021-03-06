#!/bin/bash
#
# submit to the right queue
#SBATCH -p meta_gpu-ti
#SBATCH --gres gpu:1
#SBATCH -a 1-3
#SBATCH -J DARTS_grid
#
# the execution will use the current directory for execution (important for relative paths)
#SBATCH -D .
#
# redirect the output/error to some files
#SBATCH -o ./experiments/cluster_logs/%A_%a.o
#SBATCH -e ./experiments/cluster_logs/%A_%a.e
#
#

#source activate pytorch-0.3.1-cu8-py36
#python src/search/train_search.py --unrolled --cutout --report_freq_hessian 2 --compute_hessian --space $1 --dataset $2 --drop_path_prob $3 --weight_decay $4

python src/search/train_search.py --unrolled --cutout --report_freq_hessian 2 --compute_hessian --space s1 --dataset cifar10 --drop_path_prob 0.2 --weight_decay 0.0003