#!/usr/bin/env bash
user="smirnovm"
project="sentiment-analysis-with-bert"

if [ $# -eq 0 ]
  then
    tag='latest'
  else tag=$1
fi

docker build -t $user/$project:$tag .
