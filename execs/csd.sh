#!/bin/bash

cd ..

echo
echo Creating New User
echo

./run scripts/reg2/users/managerUser.txt

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

./run scripts/reg/approved/investor-comp.txt
./run scripts/reg/approved/investor-indiv.txt
./run scripts/reg/approved/investor-trust.txt
./run scripts/reg/approved/investor-charity.txt

echo
echo Creating Participants
echo

./run scripts/reg2/participants/new-participant.txt
./run scripts/reg2/participants/participant-accounts/participant-account1.txt
