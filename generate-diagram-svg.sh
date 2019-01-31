#!/bin/bash

diagrams=$(find . -name "*.txt")

for diag in $diagrams; do
    diag=$(basename "$diag")
    diagram="${diag%.*}".tex
    cp template.tex "$diagram"
    sed -i "s/DIAGRAM/$diag/g" "$diagram"
    pdflatex -shell-escape "$diagram" > /dev/null
done
