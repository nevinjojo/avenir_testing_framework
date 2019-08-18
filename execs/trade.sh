#!/bin/bash

cd ..

echo
echo TESTING REG
echo

echo
echo Creating Transactions
echo

./run scripts/reg2/trans/participant-transactions/create-trans.txt

echo
echo Trades
echo

./run scripts/reg2/new-trade.txt

echo
echo Settlement
echo

./run scripts/reg2/settlement/settlement.txt 
