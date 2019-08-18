#!/bin/bash

cd ..

echo
echo TESTING SETTLE-WEB
echo

echo
echo Edit User Details
echo

./run scripts/settle-web/userDetails/userDetails1001.txt
./run scripts/settle-web/userDetails/userDetails1100.txt
./run scripts/settle-web/userDetails/userDetails1111.txt
./run scripts/settle-web/userDetails/userDetails4.txt
./run scripts/settle-web/userDetails/userDetails5.txt
./run scripts/settle-web/userDetails/userDetails6.txt

echo
echo Edit Password
echo

./run scripts/settle-web/userPassword/userPassword1001.txt
./run scripts/settle-web/userPassword/userPassword1100.txt
./run scripts/settle-web/userPassword/userPassword1111.txt
./run scripts/settle-web/userPassword/userPassword4.txt
./run scripts/settle-web/userPassword/userPassword5.txt
./run scripts/settle-web/userPassword/userPassword6.txt

echo
echo Update Investor Details
echo

./run scripts/settle-web/investorDetails/User1001/investorDetails1.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails2.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails3.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails4.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails5.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails6.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails7.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails8.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails9.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails10.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails11.txt
./run scripts/settle-web/investorDetails/User1001/investorDetails12.txt
./run scripts/settle-web/investorDetails/User1100/investorDetails1100.txt
./run scripts/settle-web/investorDetails/User1111/investorDetails1111.txt

echo
echo Balance Activity / Download Certificate
echo

./run scripts/settle-web/balanceActivity/BalanceActivity-User1001.txt
./run scripts/settle-web/balanceActivity/BalanceActivity-User1100.txt
./run scripts/settle-web/balanceActivity/BalanceActivity-User1111.txt


