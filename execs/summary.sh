#!/bin/sh

cd ..

find $1 -type f -name '*.txt' -exec grep -Eo "(?<=^test ).*$|(?<=^description ).*$" {} \; -exec echo {} \; > summaries.txt
