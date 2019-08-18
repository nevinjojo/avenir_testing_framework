#!/bin/bash

cd ..

echo
echo TESTING REG
echo

echo
echo Creating Transactions
echo

./run scripts/reg2/trans/participant-transactions/create/create-trans2.txt
./run scripts/reg2/trans/participant-transactions/currency-trans/currency-trans2.txt

echo
echo Trades
echo

./run scripts/reg2/trade/new-trade2.txt

echo
echo Settlement
echo

./run scripts/reg2/settlement/settlement.txt 
