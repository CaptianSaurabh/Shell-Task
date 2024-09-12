#!/bin/bash

# Set the file name for the input file
touch input.txt
input_file="input.txt"

# Count lines, words, and characters
lines=$(wc -l < "$input_file")
words=$(wc -w < "$input_file")
chars=$(wc -m < "$input_file")

echo "Number of lines: $lines"
echo "Number of words: $words"
echo "Number of characters: $chars"

# Find the longest word
longest_word=$(awk '{max = 0; for (i = 1; i <= NF; i++) {if (length($i) > max) {max = length($i); word = $i}}}; END {print word}' "$input_file")

echo "Longest word: $longest_word"