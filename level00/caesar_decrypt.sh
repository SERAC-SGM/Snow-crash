#!/bin/sh

IN="cdiiddwpgswtgt"

for I in $(seq 25); do
    echo $I $IN | tr $(printf %${I}s | tr ' ' '.')/a-z a-za-z
done

