#!/bin/bash

data_root_dir="/data/datasets/vlm-evaluation"
result_dir="/data/results/vlm-eval"

### PREPARE
python scripts/datasets/prepare.py --dataset_family gqa --root_dir $data_root_dir

# --model_id prism-dinosiglip+7b
# --model_family llava-v15 --model_id llava-v1.5-7b --model_dir liuhaotian/llava-v1.5-7b 
#gqa-full
# python scripts/evaluate.py --model_id prism-dinosiglip+7b --dataset.type vqa-v2-slim --dataset.root_dir $data_root_dir

# python scripts/evaluate.py --model_family mordal --model_id mordal-clip-l-llama2-7b-mlp --model_dir shiqihe/mordal-clip-l-llama2-7b-mlp --dataset.type gqa-slim --dataset.root_dir $data_root_dir --results_dir $result_dir
# shiqihe/mordal-clip-l-llama2-7b-mlp
# accelerate launch --num_processes=2 --mixed_precision=fp16 scripts/evaluate.py --model_family llava-v15 --model_id llava-lightning+clip+llama-2-13b --model_dir liuhaotian/llava-llama-2-13b-chat-lightning-preview --dataset.type gqa-full --dataset.root_dir $data_root_dir

### SCORE
python scripts/score.py --model_id mordal-clip-l-llama2-7b-mlp  --dataset.type gqa-slim --dataset.root_dir $data_root_dir --results_dir $result_dir


# Name: PyYAML
# Version: 6.0.1

# Name: pyyaml-include
# Version: 1.4.1

# /users/leeyongs/mordal-vlm/vlm-evaluation/results/gqa/gqa-full
# rsync -avz username@hostname:/remote/path /local/path
