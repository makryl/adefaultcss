#!/bin/sh

echo Compile default
lessc -x adefault.css adefault.min.css

echo Compile light
./atheme.sh -b '#ffffff' -t '#000000' -l '#003366' > adefault-light.min.css

echo Compile dark
./atheme.sh -b '#000000' -t '#ffffff' -l '#99ccff' > adefault-dark.min.css
