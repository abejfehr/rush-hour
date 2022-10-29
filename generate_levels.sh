#!/bin/bash

echo "Generating puzzles file..."

# Getting rid of the puzzles with walls
grep -vE "(x)" data/rush.txt | awk -v interval=4810 '(NR-1)%interval==0' | tail -r > puzzles.txt

# Make the first puzzle the one with just the red car though
tail -2 data/rush.txt | tail -r | cat - puzzles.txt > /tmp/out && mv /tmp/out puzzles.txt

# There should be 101 levels in total after this