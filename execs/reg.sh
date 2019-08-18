#!/bin/bash

cd ..

echo
echo TESTING REG
echo

echo
echo Creating New Users
echo

./run scripts/reg/users/managerUser.txt
./run scripts/reg/users/operatorUser.txt
./run scripts/reg/users/viewerUser.txt

echo
echo Creating Issuers
echo

./run scripts/reg/approved/issuer.txt

echo
echo Creating Instruments
echo

./run scripts/reg/approved/inst-debt.txt
./run scripts/reg/approved/inst-equity.txt
./run scripts/reg/approved/inst-fund.txt

echo
echo Creating Investors
echo

./run scripts/reg/approved/investor-comp.txt
./run scripts/reg/approved/investor-indiv.txt
./run scripts/reg/approved/investor-trust.txt 
./run scripts/reg/approved/investor-charity.txt

echo
echo Creating Transaction create 
echo

./run scripts/reg/transactions/create/companyC1.txt
./run scripts/reg/transactions/create/companyC2.txt
./run scripts/reg/transactions/create/companyC3.txt
./run scripts/reg/transactions/create/companyC4.txt
./run scripts/reg/transactions/create/companyC5.txt
./run scripts/reg/transactions/create/companyC6.txt
./run scripts/reg/transactions/create/companyC7.txt
./run scripts/reg/transactions/create/companyC8.txt
./run scripts/reg/transactions/create/companyC9.txt
./run scripts/reg/transactions/create/companyC10.txt
./run scripts/reg/transactions/create/trustC1.txt
./run scripts/reg/transactions/create/trustC2.txt
./run scripts/reg/transactions/create/trustC3.txt
./run scripts/reg/transactions/create/trustC4.txt
./run scripts/reg/transactions/create/trustC5.txt
./run scripts/reg/transactions/create/trustC6.txt
./run scripts/reg/transactions/create/trustC7.txt
./run scripts/reg/transactions/create/trustC8.txt
./run scripts/reg/transactions/create/trustC9.txt
./run scripts/reg/transactions/create/trustC10.txt

echo
echo Creating Transactions transfer
echo

./run scripts/reg/transactions/transfer/companyT1.txt
./run scripts/reg/transactions/transfer/companyT2.txt
./run scripts/reg/transactions/transfer/companyT3.txt
./run scripts/reg/transactions/transfer/companyT4.txt
./run scripts/reg/transactions/transfer/companyT5.txt
./run scripts/reg/transactions/transfer/companyT6.txt
./run scripts/reg/transactions/transfer/companyT7.txt
./run scripts/reg/transactions/transfer/companyT8.txt
./run scripts/reg/transactions/transfer/companyT9.txt
./run scripts/reg/transactions/transfer/companyT10.txt
./run scripts/reg/transactions/transfer/trustT1.txt
./run scripts/reg/transactions/transfer/trustT2.txt
./run scripts/reg/transactions/transfer/trustT3.txt
./run scripts/reg/transactions/transfer/trustT4.txt
./run scripts/reg/transactions/transfer/trustT5.txt
./run scripts/reg/transactions/transfer/trustT6.txt
./run scripts/reg/transactions/transfer/trustT7.txt
./run scripts/reg/transactions/transfer/trustT8.txt
./run scripts/reg/transactions/transfer/trustT9.txt
./run scripts/reg/transactions/transfer/trustT10.txt

echo
echo Creating Transactions lock
echo

./run scripts/reg/transactions/lock/companyL1.txt
./run scripts/reg/transactions/lock/companyL2.txt
./run scripts/reg/transactions/lock/companyL3.txt
./run scripts/reg/transactions/lock/companyL4.txt
./run scripts/reg/transactions/lock/companyL5.txt
./run scripts/reg/transactions/lock/companyL6.txt
./run scripts/reg/transactions/lock/companyL7.txt
./run scripts/reg/transactions/lock/companyL8.txt
./run scripts/reg/transactions/lock/companyL9.txt
./run scripts/reg/transactions/lock/companyL10.txt
./run scripts/reg/transactions/lock/trustL1.txt
./run scripts/reg/transactions/lock/trustL2.txt
./run scripts/reg/transactions/lock/trustL3.txt
./run scripts/reg/transactions/lock/trustL4.txt
./run scripts/reg/transactions/lock/trustL5.txt
./run scripts/reg/transactions/lock/trustL6.txt
./run scripts/reg/transactions/lock/trustL7.txt
./run scripts/reg/transactions/lock/trustL8.txt
./run scripts/reg/transactions/lock/trustL9.txt
./run scripts/reg/transactions/lock/trustL10.txt

echo
echo Creating Transactions unlock
echo

./run scripts/reg/transactions/unlock/companyUL1.txt
./run scripts/reg/transactions/unlock/companyUL2.txt
./run scripts/reg/transactions/unlock/companyUL3.txt
./run scripts/reg/transactions/unlock/companyUL4.txt
./run scripts/reg/transactions/unlock/companyUL5.txt
./run scripts/reg/transactions/unlock/companyUL6.txt
./run scripts/reg/transactions/unlock/companyUL7.txt
./run scripts/reg/transactions/unlock/companyUL8.txt
./run scripts/reg/transactions/unlock/companyUL9.txt
./run scripts/reg/transactions/unlock/companyUL10.txt
./run scripts/reg/transactions/unlock/trustUL1.txt
./run scripts/reg/transactions/unlock/trustUL2.txt
./run scripts/reg/transactions/unlock/trustUL3.txt
./run scripts/reg/transactions/unlock/trustUL4.txt
./run scripts/reg/transactions/unlock/trustUL5.txt
./run scripts/reg/transactions/unlock/trustUL6.txt
./run scripts/reg/transactions/unlock/trustUL7.txt
./run scripts/reg/transactions/unlock/trustUL8.txt
./run scripts/reg/transactions/unlock/trustUL9.txt
./run scripts/reg/transactions/unlock/trustUL10.txt

echo
echo Creating Transactions reserve
echo

./run scripts/reg/transactions/reserve/companyRSRV1.txt
./run scripts/reg/transactions/reserve/companyRSRV2.txt
./run scripts/reg/transactions/reserve/companyRSRV3.txt
./run scripts/reg/transactions/reserve/companyRSRV4.txt
./run scripts/reg/transactions/reserve/companyRSRV5.txt
./run scripts/reg/transactions/reserve/companyRSRV6.txt
./run scripts/reg/transactions/reserve/companyRSRV7.txt
./run scripts/reg/transactions/reserve/companyRSRV8.txt
./run scripts/reg/transactions/reserve/companyRSRV9.txt
./run scripts/reg/transactions/reserve/companyRSRV10.txt
./run scripts/reg/transactions/reserve/trustRSRV1.txt
./run scripts/reg/transactions/reserve/trustRSRV2.txt
./run scripts/reg/transactions/reserve/trustRSRV3.txt
./run scripts/reg/transactions/reserve/trustRSRV4.txt
./run scripts/reg/transactions/reserve/trustRSRV5.txt
./run scripts/reg/transactions/reserve/trustRSRV6.txt
./run scripts/reg/transactions/reserve/trustRSRV7.txt
./run scripts/reg/transactions/reserve/trustRSRV8.txt
./run scripts/reg/transactions/reserve/trustRSRV9.txt
./run scripts/reg/transactions/reserve/trustRSRV10.txt

echo
echo Creating Transactions unreserve
echo

./run scripts/reg/transactions/unreserve/companyUR1.txt
./run scripts/reg/transactions/unreserve/companyUR2.txt
./run scripts/reg/transactions/unreserve/companyUR3.txt
./run scripts/reg/transactions/unreserve/companyUR4.txt
./run scripts/reg/transactions/unreserve/companyUR5.txt
./run scripts/reg/transactions/unreserve/companyUR6.txt
./run scripts/reg/transactions/unreserve/companyUR7.txt
./run scripts/reg/transactions/unreserve/companyUR8.txt
./run scripts/reg/transactions/unreserve/companyUR9.txt
./run scripts/reg/transactions/unreserve/companyUR10.txt
./run scripts/reg/transactions/unreserve/trustUR1.txt
./run scripts/reg/transactions/unreserve/trustUR2.txt
./run scripts/reg/transactions/unreserve/trustUR3.txt
./run scripts/reg/transactions/unreserve/trustUR4.txt
./run scripts/reg/transactions/unreserve/trustUR5.txt
./run scripts/reg/transactions/unreserve/trustUR6.txt
./run scripts/reg/transactions/unreserve/trustUR7.txt
./run scripts/reg/transactions/unreserve/trustUR8.txt
./run scripts/reg/transactions/unreserve/trustUR9.txt
./run scripts/reg/transactions/unreserve/trustUR10.txt

echo
echo Creating Transactions remove
echo

./run scripts/reg/transactions/remove/companyR1.txt
./run scripts/reg/transactions/remove/companyR2.txt
./run scripts/reg/transactions/remove/companyR3.txt
./run scripts/reg/transactions/remove/companyR4.txt
./run scripts/reg/transactions/remove/companyR5.txt
./run scripts/reg/transactions/remove/companyR6.txt
./run scripts/reg/transactions/remove/companyR7.txt
./run scripts/reg/transactions/remove/companyR8.txt
./run scripts/reg/transactions/remove/companyR9.txt
./run scripts/reg/transactions/remove/companyR10.txt
./run scripts/reg/transactions/remove/trustR1.txt
./run scripts/reg/transactions/remove/trustR2.txt
./run scripts/reg/transactions/remove/trustR3.txt
./run scripts/reg/transactions/remove/trustR4.txt
./run scripts/reg/transactions/remove/trustR5.txt
./run scripts/reg/transactions/remove/trustR6.txt
./run scripts/reg/transactions/remove/trustR7.txt
./run scripts/reg/transactions/remove/trustR8.txt
./run scripts/reg/transactions/remove/trustR9.txt
./run scripts/reg/transactions/remove/trustR10.txt


echo
echo Negative Tests
echo

./run scripts/reg/negative/neg-inst.txt
./run scripts/reg/negative/neg-invst.txt
./run scripts/reg/negative/neg-issuer.txt
./run scripts/reg/negative/neg-transCreate.txt
./run scripts/reg/negative/neg-transTransfer.txt
./run scripts/reg/negative/neg-transLock.txt
