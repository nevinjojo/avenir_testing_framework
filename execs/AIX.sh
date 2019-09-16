#!/bin/bash

cd ..

echo
echo TESTING AIX - aix setup
echo

echo
echo Users
echo

./run scripts/AIX/users/new-viewerUser.txt
./run scripts/AIX/users/new-managerUser.txt
./run scripts/AIX/users/new-operatorUser.txt

echo
echo Issuers
echo 

./run scripts/AIX/issuers/issuer.txt
./run scripts/AIX/issuers/issuer-accounts.txt
./run scripts/AIX/issuers/issuer-users.txt
./run scripts/AIX/issuers/issuer-decline.txt
./run scripts/AIX/issuers/issuer-suspend.txt
./run scripts/AIX/issuers/issuer-accounts-suspend.txt
./run scripts/AIX/issuers/issuer-users-suspend.txt

echo 
echo Instruments
echo

./run scripts/AIX/instruments/inst-debt.txt
./run scripts/AIX/instruments/inst-equity.txt
./run scripts/AIX/instruments/inst-fund.txt
./run scripts/AIX/instruments/inst-equity2.txt
./run scripts/AIX/instruments/inst-debt-decline.txt
./run scripts/AIX/instruments/inst-equity-decline.txt
./run scripts/AIX/instruments/inst-fund-decline.txt
./run scripts/AIX/instruments/inst-suspend.txt

echo 
echo Investors
echo

./run scripts/AIX/investors/indiv-domestic.txt
./run scripts/AIX/investors/indiv-foreign.txt
./run scripts/AIX/investors/company-domestic.txt
./run scripts/AIX/investors/company-foreign.txt
./run scripts/AIX/investors/investor-decline.txt
./run scripts/AIX/investors/investor-suspend.txt

echo
echo Instruments - Reports Download
echo

./run scripts/AIX/inst-reportsDownload/inst-debt1.txt
./run scripts/AIX/inst-reportsDownload/inst-equity1.txt
./run scripts/AIX/inst-reportsDownload/inst-fund1.txt

echo
echo Participants - Brokers / Custodians / CSD
echo

./run scripts/AIX/participants/new-broker.txt
./run scripts/AIX/participants/new-custodian.txt
# maker/checker turned off
./run scripts/AIX/participants/new-broker2.txt
./run scripts/AIX/participants/new-custodian2.txt
./run scripts/AIX/participants/new-CSD.txt

# participant accounts / users
./run scripts/AIX/participants/part-accounts/broker-accounts.txt
./run scripts/AIX/participants/part-accounts/custodian-accounts.txt
./run scripts/AIX/participants/part-accounts/CSD-accounts.txt

./run scripts/AIX/participants/part-users/broker-users.txt
./run scripts/AIX/participants/part-users/cust-users.txt
./run scripts/AIX/participants/part-users/CSD-users.txt

echo
echo Transactions
echo

./run scripts/AIX/trans/create-transaction1.txt
./run scripts/AIX/trans/lock-transaction1.txt
./run scripts/AIX/trans/unlock-transaction1.txt
./run scripts/AIX/trans/remove-transaction1.txt
# declining and deleting transactions
./run scripts/AIX/trans/create-transaction2.txt
./run scripts/AIX/trans/transfer-transaction2.txt
./run scripts/AIX/trans/lock-transaction2.txt
./run scripts/AIX/trans/unlock-transaction2.txt
./run scripts/AIX/trans/remove-transaction2.txt

echo
echo Adjustments
echo

./run scripts/AIX/adjustments/adjustment1.txt
./run scripts/AIX/adjustments/adjustment2.txt
./run scripts/AIX/adjustments/adjustment3.txt

./run scripts/AIX/adjustments/adjustment-mkchk1.txt
./run scripts/AIX/adjustments/adjustment-mkchk2.txt

./run scripts/AIX/adjustments/adjustment1-trans.txt
./run scripts/AIX/adjustments/adjustment2-trans.txt
./run scripts/AIX/adjustments/adjmkchk1-trans.txt

echo
echo Testing Reports
echo

./run scripts/AIX/reports/oper/participants-acc-report.txt
./run scripts/AIX/reports/oper/logins-report.txt
./run scripts/AIX/reports/oper/investor-holdings-report.txt
./run scripts/AIX/reports/oper/trades-report.txt
./run scripts/AIX/reports/oper/participants-holdings-report.txt
./run scripts/AIX/reports/oper/charge-summary-report.txt
./run scripts/AIX/reports/oper/charges-report.txt
./run scripts/AIX/reports/oper/trans-settled-report.txt
./run scripts/AIX/reports/oper/suspended-users.txt
./run scripts/AIX/reports/oper/investor-report.txt
./run scripts/AIX/reports/oper/login-failures-report.txt

./run scripts/AIX/reports/broker/partAcc-report.txt
./run scripts/AIX/reports/broker/partHoldings-report.txt
./run scripts/AIX/reports/broker/trades-report.txt
./run scripts/AIX/reports/broker/trans-settled-report.txt
./run scripts/AIX/reports/broker/adjustments-report.txt


