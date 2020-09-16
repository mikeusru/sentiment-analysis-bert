#!/usr/bin/env bash
docker run --gpus all -p 8888:8888 -v ${PWD}:/workspace/src/ smirnovm/sentiment-analysis-with-bert
