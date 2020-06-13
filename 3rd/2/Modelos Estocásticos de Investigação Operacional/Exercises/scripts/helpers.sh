#!/bin/bash

function echo_error() {
  printf '\033[31mERROR:\033[0m %s\n' "$@"
}

function echo_warning() {
  printf '\033[33mWARNING:\033[0m %s\n' "$@"
}

function echo_done() {
  printf '\033[32mDONE:\033[0m %s\n' "$@"
}

function echo_info() {
  printf '\033[36m[%s]\033[0m ' "$1"
  shift 1
  echo "$@"
  echo
}

not_installed() {
  [ ! -x "$(command -v "$@")" ]
}

