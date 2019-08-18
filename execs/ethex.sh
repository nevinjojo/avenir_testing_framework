#!/bin/bash

cd ..

echo
echo TESTING ETHEX
echo

echo
echo Creating Holders
echo

./run scripts/Ethex/holders/holder-comp.txt
./run scripts/Ethex/holders/holder-indiv.txt
./run scripts/Ethex/holders/holder-trust.txt
./run scripts/Ethex/holders/holder-charity.txt
./run scripts/Ethex/holders/holder-bankacc.txt

./run scripts/Ethex/holders/comp-accounts.txt
./run scripts/Ethex/holders/indiv-accounts.txt
./run scripts/Ethex/holders/trust-accounts.txt
./run scripts/Ethex/holders/charity-accounts.txt

echo
echo Creating Issuers
echo

./run scripts/Ethex/issuers/issuer.txt

echo
echo Creating Instruments
echo

./run scripts/Ethex/instruments/inst-debt.txt
./run scripts/Ethex/instruments/inst-equity.txt
./run scripts/Ethex/instruments/inst-fund.txt

echo Creating Instruments - Certificate Download Enabled / Certificates

./run scripts/Ethex/instruments/certificates-reports/inst-debt1.txt
./run scripts/Ethex/instruments/certificates-reports/inst-equity1.txt
./run scripts/Ethex/instruments/certificates-reports/inst-fund1.txt
./run scripts/Ethex/instruments/certificates-reports/inst-debt2.txt
./run scripts/Ethex/instruments/certificates-reports/inst-equity2.txt
./run scripts/Ethex/instruments/certificates-reports/inst-fund2.txt
./run scripts/Ethex/instruments/certificates-reports/inst-debt3.txt
./run scripts/Ethex/instruments/certificates-reports/inst-equity3.txt
./run scripts/Ethex/instruments/certificates-reports/inst-fund3.txt

echo 
echo Transactions
echo

./run scripts/Ethex/transactions/create/company-create.txt
./run scripts/Ethex/transactions/create/trust-create.txt

./run scripts/Ethex/transactions/transfer/company-transfer.txt
./run scripts/Ethex/transactions/transfer/trust-transfer.txt

./run scripts/Ethex/transactions/lock/company-lock.txt
./run scripts/Ethex/transactions/lock/trust-lock.txt

./run scripts/Ethex/transactions/unlock/company-unlock.txt
./run scripts/Ethex/transactions/unlock/trust-unlock.txt

./run scripts/Ethex/transactions/reserve/company-reserve.txt
./run scripts/Ethex/transactions/reserve/trust-reserve.txt

./run scripts/Ethex/transactions/unreserve/company-unreserve.txt
./run scripts/Ethex/transactions/unreserve/trust-unreserve.txt

./run scripts/Ethex/transactions/remove/company-remove.txt
./run scripts/Ethex/transactions/remove/trust-remove.txt

./run scripts/Ethex/transactions/currency-create/EUR-trans.txt
./run scripts/Ethex/transactions/currency-create/GBP-trans.txt
./run scripts/Ethex/transactions/currency-create/USD-trans.txt

