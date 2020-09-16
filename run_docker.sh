#!/usr/bin/env bash
docker run -p 8888:8888 -v ${PWD}:/workspace/src/ smirnovm/sentiment-analysis-with-bert
