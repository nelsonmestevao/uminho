#!/bin/bash

. nomes.sh

for i in {1..10}; do
  nome=$((RANDOM % ${#NOMES[@]}))
  apelido=$((RANDOM % ${#APELIDOS[@]}))
  idade=$((RANDOM % 100 + 1))
  # echo "\"${NOMES[nome]} ${APELIDOS[apelido]}\" $idade"
  ./../bin/pessoas "${NOMES[nome]} ${APELIDOS[apelido]}" $idade
done
