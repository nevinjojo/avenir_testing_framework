#!/bin/bash

cd ..

echo
echo Creating Instruments - Reports Download
echo

./run scripts/AIX/inst-reportsDownload/inst-debt1.txt
./run scripts/AIX/inst-reportsDownload/inst-equity1.txt
./run scripts/AIX/inst-reportsDownload/inst-fund1.txt

echo 
echo Broker Accounts
echo

./run scripts/AIX/participants/part-accounts/PART02-accounts.txt
./run scripts/AIX/participants/part-accounts/PART03-accounts.txt
./run scripts/AIX/participants/part-accounts/PART04-accounts.txt
./run scripts/AIX/participants/part-accounts/PART05-accounts.txt
./run scripts/AIX/participants/part-accounts/PART06-accounts.txt
./run scripts/AIX/participants/part-accounts/PART08-accounts.txt
./run scripts/AIX/participants/part-accounts/PART09-accounts.txt
./run scripts/AIX/participants/part-accounts/PART11-accounts.txt
./run scripts/AIX/participants/part-accounts/PART12-accounts.txt
./run scripts/AIX/participants/part-accounts/PART13-accounts.txt
./run scripts/AIX/participants/part-accounts/PART14-accounts.txt
./run scripts/AIX/participants/part-accounts/PART15-accounts.txt
./run scripts/AIX/participants/part-accounts/PART17-accounts.txt
./run scripts/AIX/participants/part-accounts/PART18-accounts.txt
./run scripts/AIX/participants/part-accounts/PART19-accounts.txt
./run scripts/AIX/participants/part-accounts/PART20-accounts.txt

echo
echo Custodian Accounts
echo

./run scripts/AIX/participants/custodian-accounts/CUST02-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST03-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST04-accounts.txt

./run scripts/AIX/participants/custodian-accounts/CUST06-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST07-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST08-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST09-accounts.txt

./run scripts/AIX/participants/custodian-accounts/CUST11-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST12-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST13-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST14-accounts.txt

./run scripts/AIX/participants/custodian-accounts/CUST16-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST17-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST18-accounts.txt
./run scripts/AIX/participants/custodian-accounts/CUST19-accounts.txt

echo
echo Broker Users
echo

./run scripts/AIX/participants/part-users/PART03-user.txt

./run scripts/AIX/participants/part-users/PART07-user.txt
./run scripts/AIX/participants/part-users/PART08-user.txt
./run scripts/AIX/participants/part-users/PART09-user.txt

./run scripts/AIX/participants/part-users/PART11-user.txt
./run scripts/AIX/participants/part-users/PART12-user.txt
./run scripts/AIX/participants/part-users/PART13-user.txt

./run scripts/AIX/participants/part-users/PART16-user.txt
./run scripts/AIX/participants/part-users/PART17-user.txt

./run scripts/AIX/participants/part-users/PART19-user.txt
./run scripts/AIX/participants/part-users/PART20-user.txt

echo
echo Custodian Users
echo

./run scripts/AIX/participants/custodian-users/CUST03-user.txt
./run scripts/AIX/participants/custodian-users/CUST04-user.txt
./run scripts/AIX/participants/custodian-users/CUST07-user.txt
./run scripts/AIX/participants/custodian-users/CUST08-user.txt
./run scripts/AIX/participants/custodian-users/CUST09-user.txt
./run scripts/AIX/participants/custodian-users/CUST10-user.txt
./run scripts/AIX/participants/custodian-users/CUST11-user.txt
./run scripts/AIX/participants/custodian-users/CUST12-user.txt
./run scripts/AIX/participants/custodian-users/CUST13-user.txt
./run scripts/AIX/participants/custodian-users/CUST14-user.txt
./run scripts/AIX/participants/custodian-users/CUST16-user.txt
./run scripts/AIX/participants/custodian-users/CUST17-user.txt
./run scripts/AIX/participants/custodian-users/CUST18-user.txt
./run scripts/AIX/participants/custodian-users/CUST19-user.txt

./run scripts/AIX/adjustments/adjustment2.txt
./run scripts/AIX/adjustments/adjustment3.txt
./run scripts/AIX/adjustments/adjustment4.txt
./run scripts/AIX/adjustments/adjustment5.txt
./run scripts/AIX/adjustments/adjustment-mkchk1.txt


