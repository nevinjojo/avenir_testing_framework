#!/bin/bash

cd ..

echo
echo TESTING ARL_UK
echo

echo
echo Creating Holders
echo

./run scripts/ARLUK/holders/holder-comp.txt
./run scripts/ARLUK/holders/holder-indiv.txt
./run scripts/ARLUK/holders/holder-trust.txt
./run scripts/ARLUK/holders/holder-charity.txt
./run scripts/ARLUK/holders/holder-bankacc.txt

echo
echo Creating Issuers
echo

./run scripts/ARLUK/issuers/issuer.txt

echo
echo Creating Instruments
echo 

./run scripts/ARLUK/instruments/inst-debt.txt
./run scripts/ARLUK/instruments/inst-equity.txt
./run scripts/ARLUK/instruments/inst-fund.txt

echo
echo Download Certificates / Reports
echo

./run scripts/ARLUK/instruments/certificates-reports/inst-debt1.txt
./run scripts/ARLUK/instruments/certificates-reports/inst-equity1.txt
./run scripts/ARLUK/instruments/certificates-reports/inst-fund1.txt

echo
echo CREST Features Enabled - Instruments
echo

./run scripts/ARLUK/instruments/CREST-instruments/debt-inst.txt
./run scripts/ARLUK/instruments/CREST-instruments/equity-inst.txt
./run scripts/ARLUK/instruments/CREST-instruments/fund-inst.txt

echo
echo Creating Transactions
echo

echo
echo Creating Transaction create 
echo

./run scripts/ARLUK/transactions/create/company-create.txt
./run scripts/ARLUK/transactions/create/trust-create.txt

echo
echo Creating Transactions transfer
echo

./run scripts/ARLUK/transactions/transfer/company-transfer.txt
./run scripts/ARLUK/transactions/transfer/trust-transfer.txt

echo
echo Creating Transactions lock
echo

./run scripts/ARLUK/transactions/lock/company-lock.txt
./run scripts/ARLUK/transactions/lock/trust-lock.txt

echo
echo Creating Transactions unlock
echo

./run scripts/ARLUK/transactions/unlock/company-unlock.txt
./run scripts/ARLUK/transactions/unlock/trust-unlock.txt

echo
echo Creating Transactions reserve
echo

./run scripts/ARLUK/transactions/reserve/company-reserve.txt
./run scripts/ARLUK/transactions/reserve/trust-reserve.txt

echo
echo Creating Transactions unreserve
echo

./run scripts/ARLUK/transactions/unreserve/company-unreserve.txt
./run scripts/ARLUK/transactions/unreserve/trust-unreserve.txt

echo
echo Creating Transactions remove
echo

./run scripts/ARLUK/transactions/remove/company-remove.txt
./run scripts/ARLUK/transactions/remove/trust-remove.txt

