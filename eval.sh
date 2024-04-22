#!/bin/bash

data_root_dir="/data/datasets/vlm-evaluation"
result_dir="/data/results/vlm-eval"

### PREPARE
# python scripts/datasets/prepare.py --dataset_family text-vqa --root_dir $data_root_dir

# --model_id prism-dinosiglip+7b
# --model_family llava-v15 --model_id llava-v1.5-7b --model_dir liuhaotian/llava-v1.5-7b 
#gqa-full
# python scripts/evaluate.py --model_id prism-dinosiglip+7b --dataset.type vqa-v2-slim --dataset.root_dir $data_root_dir

# shiqihe/mordal-clip-b-vicuna-v15-7b-mlp 38.00
# 04/17 [00:34:29] INFO     | >> [*] Results for Model `mordal-clip-b-vicuna-v15-7b-mlp` on         textvqa.py:327
#                           text-vqa-full (Split = val)                                                           
#                                     => TextVQA-OCR  Accuracy (Official): 0.341                                  
#                                     => TextVQA-Pure Accuracy (Official): 0.109     
# shiqihe/mordal-clip-l-vicuna-v15-7b-mlp 40.000      
# shiqihe/mordal-clip-l-llama2-7b-chat-mlp 42.000
# "prism-dinosiglip+7b" "instructblip-vicuna-7b" "prism-clip+7b" 
# models=("prism-siglip+7b" "llava-v1.5-7b")
models=("mordal-clip-l-vicuna-v15-7b-mlp" "mordal-clip-l-llama2-7b-chat-mlp")

# model_id="instructblip-vicuna-7b"
data="text-vqa-full"

for model_id in ${models[@]}; do
    echo $model_id
    python scripts/evaluate.py --model_id $model_id --dataset.type $data --dataset.root_dir $data_root_dir --results_dir $result_dir
    python scripts/score.py --model_id $model_id  --dataset.type $data --dataset.root_dir $data_root_dir --results_dir $result_dir
done

# python scripts/evaluate.py --model_id $model_id --dataset.type $data --dataset.root_dir $data_root_dir --results_dir $result_dir
# python scripts/evaluate.py --model_family mordal --model_id $model_id --model_dir shiqihe/$model_id --dataset.type $data --dataset.root_dir $data_root_dir --results_dir $result_dir
# shiqihe/mordal-clip-l-llama2-7b-mlp
# accelerate launch --num_processes=2 --mixed_precision=fp16 scripts/evaluate.py --model_family llava-v15 --model_id llava-lightning+clip+llama-2-13b --model_dir liuhaotian/llava-llama-2-13b-chat-lightning-preview --dataset.type gqa-full --dataset.root_dir $data_root_dir

### SCORE
# python scripts/score.py --model_id $model_id  --dataset.type $data --dataset.root_dir $data_root_dir --results_dir $result_dir


# Name: PyYAML
# Version: 6.0.1

# Name: pyyaml-include
# Version: 1.4.1

# /users/leeyongs/mordal-vlm/vlm-evaluation/results/gqa/gqa-full
# rsync -avz username@hostname:/remote/path /local/path
