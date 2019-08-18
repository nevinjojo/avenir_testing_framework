#!/bin/bash
######################################################################
# Script that finds all instances of test/description keywords and
# captures them into 3 line output:
# - test name
# - test description
# - test file
#
# Ferry Hendrikx, August 2018
######################################################################

PRODUCT=$1

if [ -z "$PRODUCT" ]; then
    echo "ERROR: please specify a product (e.g. settle)"

    exit 1
fi

find $PRODUCT -type f -exec grep -H "\(^test\|^description\)" {} \; | grep -v "\#" | awk -F: '{ if ($2 ~ /^description/) print $2 "\n" $1 "\n"; else print $2; }' | sed 's/^test \(.*\)/\1/' | sed 's/^description \(.*\)/\1/'

