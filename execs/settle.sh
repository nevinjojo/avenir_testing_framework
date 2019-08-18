#!/bin/bash

cd ..

# echo
# echo TESTING SETTLE
# echo

# echo
# echo Creating Holders
# echo

# ./run scripts/settle-test/holders/holder-comp.txt
# ./run scripts/settle-test/holders/holder-indiv.txt
# ./run scripts/settle-test/holders/holder-trust.txt
# ./run scripts/settle-test/holders/holder-charity.txt

# echo
# echo Creating Issuers
# echo

# ./run scripts/settle-test/issuers/issuer.txt

# echo
# echo Creating Instruments
# echo 

# ./run scripts/settle-test/instruments/inst-debt.txt
# ./run scripts/settle-test/instruments/inst-equity.txt
# ./run scripts/settle-test/instruments/inst-fund.txt

echo
echo Download Certificates / Reports
echo

./run scripts/settle-test/instruments/certificates-reports/inst-debt1.txt
./run scripts/settle-test/instruments/certificates-reports/inst-equity1.txt
./run scriprs/settle-test/instruments/certificates-reports/inst-fund1.txt

echo
echo CREST Features Enabled - Instruments
echo

./run scripts/settle-test/instruments/CREST-instruments/debt-inst.txt
./run scripts/settle-test/instruments/CREST-instruments/equity-inst.txt
./run scripts/settle-test/instruments/CREST-instruments/fund-inst.txt

echo
echo Creating Transactions
echo

echo
echo Creating Transaction create 
echo

./run scripts/settle-test/transactions/create/company-create.txt
./run scripts/settle-test/transactions/create/trust-create.txt

echo
echo Creating Transactions transfer
echo

./run scripts/settle-test/transactions/transfer/company-transfer.txt
./run scripts/settle-test/transactions/transfer/trust-transfer.txt

echo
echo Creating Transactions lock
echo

./run scripts/settle-test/transactions/lock/company-lock.txt
./run scripts/settle-test/transactions/lock/trust-lock.txt

echo
echo Creating Transactions unlock
echo

./run scripts/settle-test/transactions/unlock/company-unlock.txt
./run scripts/settle-test/transactions/unlock/trust-unlock.txt

echo
echo Creating Transactions reserve
echo

./run scripts/settle-test/transactions/reserve/company-reserve.txt
./run scripts/settle-test/transactions/reserve/trust-reserve.txt

echo
echo Creating Transactions unreserve
echo

./run scripts/settle-test/transactions/unreserve/company-unreserve.txt
./run scripts/settle-test/transactions/unreserve/trust-unreserve.txt

echo
echo Creating Transactions remove
echo

./run scripts/settle-test/transactions/remove/company-remove.txt
./run scripts/settle-test/transactions/remove/trust-remove.txt

