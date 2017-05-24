#!/bin/bash
module load anaconda3 cudatoolkit/8.0 cudann/cuda-8.0/5.1

# train
CKPT=$(python deep_latent_gaussian_model_train.py "$@")

# eval
python deep_latent_gaussian_model_train.py \
  "$@" \
  --eval_only \
  --q/n_samples_stats 5000 \
  --batch_size 1 \
  --ckpt_to_restore $CKPT \
