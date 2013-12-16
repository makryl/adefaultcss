#!/bin/bash

echo Clear
rm *.min.css

echo Compress default
yui-compressor adefault.css > adefault.min.css

echo Prepare themes
cp adefault.min.css adefault-light.min.css
cp adefault.min.css adefault-lighter.min.css
cp adefault.min.css adefault-dark.min.css
cp adefault.min.css adefault-darker.min.css

echo Compress themes
yui-compressor adefault-light.css   | sed 's/@import "adefault.css";//' >> adefault-light.min.css
yui-compressor adefault-lighter.css | sed 's/@import "adefault.css";//' >> adefault-lighter.min.css
yui-compressor adefault-dark.css    | sed 's/@import "adefault.css";//' >> adefault-dark.min.css
yui-compressor adefault-darker.css  | sed 's/@import "adefault.css";//' >> adefault-darker.min.css

echo Done
