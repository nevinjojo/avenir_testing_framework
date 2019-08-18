#!/bin/bash

cd ..

echo
echo TESTING REG2
echo

echo
echo Creating Issuers
echo

./run scripts/reg2/issuers/issuer.txt

echo
echo Creating Instruments
echo

./run scripts/reg2/instruments/inst-debt.txt
./run scripts/reg2/instruments/inst-equity.txt
./run scripts/reg2/instruments/inst-fund.txt

echo
echo Creating Investors
echo

./run scripts/reg2/investors/indiv-domestic.txt
./run scripts/reg2/investors/indiv-foreign.txt
./run scripts/reg2/investors/company-domestic.txt
./run scripts/reg2/investors/company-foreign.txt

echo
echo Creating Participants
echo

./run scripts/reg2/participants/new-participant.txt
./run scripts/reg2/participants/participant-accounts/participant-account1.txt
./run scripts/reg2/participants/new-broker.txt
./run scripts/reg2/participants/new-GCM.txt
./run scripts/reg2/participants/new-NCM.txt
./run scripts/reg2/participants/new-DCM.txt

# echo
# echo Creating Trades
# echo

# ./run scripts/reg2/trade/new-trade.txt
# ./run scripts/reg2/trade/test-trade.txt

# echo
# echo Transactions
# echo

# ./run scripts/reg2/trans/investor-transactions/create-trans.txt
# ./run scripts/reg2/trans/investor-transactions/transfer-trans.txt
# ./run scripts/reg2/trans/investor-transactions/lock-trans.txt
# ./run scripts/reg2/trans/investor-transactions/unlock-trans.txt
# ./run scripts/reg2/trans/investor-transactions/remove-trans.txt
# ./run scripts/reg2/trans/participant-transactions/create-trans.txt
# ./run scripts/reg2/trans/participant-transactions/transfer-trans.txt
# ./run scripts/reg2/trans/participant-transactions/lock-trans.txt
# ./run scripts/reg2/trans/participant-transactions/unlock-trans.txt
# ./run scripts/reg2/trans/participant-transactions/remove-trans.txt
# ./run scripts/reg2/trans/participant-transactions/currency-trans/currency-trans1.txt
# ./run scripts/reg2/trans/participant-transactions/currency-trans/trans-test1.txt

