#!/bin/bash

if grep butt <<< "foobut"
  then 
    echo "good"
    echo "very good"
    exit 0
  else 
    echo "bad"
    exit 1
fi
