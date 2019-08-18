#!/bin/bash

cd ..

echo
echo Testing Transactions - AIX
echo

./run -p scripts/AIX/trans/create-transaction1.txt
./run -p scripts/AIX/trans/transfer-transaction1.txt
./run -p scripts/AIX/trans/lock-transaction1.txt
./run -p scripts/AIX/trans/unlock-transaction1.txt
./run -p scripts/AIX/trans/remove-transaction1.txt

echo
echo Declining and Deleting Transactions - AIX
echo

./run -p scripts/AIX/trans/create-transaction2.txt
./run -p scripts/AIX/trans/transfer-transaction2.txt
./run -p scripts/AIX/trans/lock-transaction2.txt
./run -p scripts/AIX/trans/unlock-transaction2.txt
./run -p scripts/AIX/trans/remove-transaction2.txt