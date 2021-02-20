#!/usr/bin/env bash

DATASETS=(
  https://datasets.imdbws.com/name.basics.tsv.gz
  https://datasets.imdbws.com/title.basics.tsv.gz
  https://datasets.imdbws.com/title.principals.tsv.gz
  https://datasets.imdbws.com/title.ratings.tsv.gz
)

for dataset in "${DATASETS[@]}"; do
  wget "$dataset"
done
