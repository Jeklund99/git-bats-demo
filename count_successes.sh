#!/usr/bin/env bash

  tar_file=$1

  SCRATCH=$(mktemp --directory)
  
  # z means working with compressed tar file
  # x means extract contents
  # f means which file we are extracting
  # --directory specifies which the directory the files should go in 
  tar zxf "$tar_file" --directory "$SCRATCH"

  num_successes=$(grep -lr SUCCESS "$SCRATCH" | wc -l)
  num_failures=$(grep -lr FAILURE "$SCRATCH" | wc -l)

  echo "There were $num_successes successes and $num_failures."

  rm -rf "$SCRATCH"
