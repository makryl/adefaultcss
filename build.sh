#!/bin/sh

echo Compile default
lessc -x adefault.css adefault.min.css

echo Compile light
./atheme.sh -b '#ffffff' -t '#000000' -l '#003366' > adefault-light.min.css

echo Compile lighter
./atheme.sh -b '#ffffff' -t '#404040' -l '#336699' > adefault-lighter.min.css

echo Compile dark
./atheme.sh -b '#000000' -t '#ffffff' > adefault-dark.min.css

echo Compile darker
./atheme.sh -b '#000000' -t '#c0c0c0' > adefault-darker.min.css
