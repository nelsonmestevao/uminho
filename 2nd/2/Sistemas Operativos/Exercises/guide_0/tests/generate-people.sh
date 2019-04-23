#!/bin/bash

. tests/nomes.sh

for i in {1..1000}; do
  nome=$((RANDOM % ${#NOMES[@]}))
  apelido=$((RANDOM % ${#APELIDOS[@]}))
  idade=$((RANDOM % 100 + 1))
  ./bin/pessoas -i "${NOMES[nome]} ${APELIDOS[apelido]}" $idade
done
