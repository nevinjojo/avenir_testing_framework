#!/bin/bash

echo
echo Participant Accounts + Users
echo


echo
echo Broker Accounts
echo

cd ..

./run scripts/AIX/participants/part-accounts/PART11-accounts.txt
./run scripts/AIX/participants/part-accounts/PART12-accounts.txt
./run scripts/AIX/participants/part-accounts/PART13-accounts.txt
./run scripts/AIX/participants/part-accounts/PART14-accounts.txt
./run scripts/AIX/participants/part-accounts/PART15-accounts.txt
./run scripts/AIX/participants/part-accounts/PART16-accounts.txt
./run scripts/AIX/participants/part-accounts/PART17-accounts.txt
./run scripts/AIX/participants/part-accounts/PART18-accounts.txt
./run scripts/AIX/participants/part-accounts/PART19-accounts.txt
./run scripts/AIX/participants/part-accounts/PART20-accounts.txt

echo
echo Broker Users
echo

./run scripts/AIX/participants/part-users/PART11-user.txt
./run scripts/AIX/participants/part-users/PART12-user.txt
./run scripts/AIX/participants/part-users/PART13-user.txt
./run scripts/AIX/participants/part-users/PART14-user.txt
./run scripts/AIX/participants/part-users/PART15-user.txt
./run scripts/AIX/participants/part-users/PART16-user.txt
./run scripts/AIX/participants/part-users/PART17-user.txt
./run scripts/AIX/participants/part-users/PART18-user.txt
./run scripts/AIX/participants/part-users/PART19-user.txt
./run scripts/AIX/participants/part-users/PART20-user.txt
