#!/bin/bash

cd ..

echo 
echo TESTING - ARLNZ
echo

# echo 
# echo Creating Investors
# echo

# ./run scripts/ARLNZ/investors/investor-comp.txt
# ./run scripts/ARLNZ/investors/investor-indiv.txt
# ./run scripts/ARLNZ/investors/investor-trust.txt
# ./run scripts/ARLNZ/investors/investor-charity.txt

# echo
# echo Creating Issuers
# echo

# ./run scripts/ARLNZ/issuers/issuer.txt

# echo
# echo Creating Instruments
# echo

# ./run scripts/ARLNZ/instruments/inst-debt.txt
# ./run scripts/ARLNZ/instruments/inst-equity.txt
# ./run scripts/ARLNZ/instruments/inst-fund.txt

# echo
# echo Creating Instruments - Certificate Download Enabled
# echo

# ./run scripts/ARLNZ/instruments/certificates-reports/inst-debt1.txt
# ./run scripts/ARLNZ/instruments/certificates-reports/inst-equity1.txt
# ./run scripts/ARLNZ/instruments/certificates-reports/inst-fund1.txt

# echo
# echo Creating Participants
# echo

# ./run scripts/ARLNZ/participant/new-custodian.txt

echo
echo Creating Transactions
echo 

echo
echo Creating Transaction create 
echo

./run scripts/ARLNZ/transactions/create/company-create.txt
./run scripts/ARLNZ/transactions/create/trust-create.txt

echo
echo Creating Transactions transfer
echo

./run scripts/ARLNZ/transactions/transfer/company-transfer.txt
./run scripts/ARLNZ/transactions/transfer/trust-transfer.txt

echo
echo Creating Transactions lock
echo

./run scripts/ARLNZ/transactions/lock/company-lock.txt
./run scripts/ARLNZ/transactions/lock/trust-lock.txt

echo
echo Creating Transactions unlock
echo

./run scripts/ARLNZ/transactions/unlock/company-unlock.txt
./run scripts/ARLNZ/transactions/unlock/trust-unlock.txt

echo
echo Creating Transactions reserve
echo

./run scripts/ARLNZ/transactions/reserve/company-reserve.txt
./run scripts/ARLNZ/transactions/reserve/trust-reserve.txt

echo
echo Creating Transactions unreserve
echo

./run scripts/ARLNZ/transactions/unreserve/company-unreserve.txt
./run scripts/ARLNZ/transactions/unreserve/trust-unreserve.txt

echo
echo Creating Transactions remove
echo

./run scripts/ARLNZ/transactions/remove/company-remove.txt
./run scripts/ARLNZ/transactions/remove/trust-remove.txt



