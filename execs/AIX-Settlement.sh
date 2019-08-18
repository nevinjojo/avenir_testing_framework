#!/bin/bash

cd ..

echo
echo AIX - trade / transactions / settlement
echo

echo
echo DAY ONE
echo

./run -p scripts/AIX/transactions-trades/create-trans.txt
./run -p scripts/AIX/transactions-trades/USD-trans.txt

./run -p scripts/AIX/transactions-trades/new-trade.txt

# roll BD

# echo
# echo DAY TWO
# echo

# ./run -p scripts/AIX/transactions-trades/create2-trans.txt
# ./run -p scripts/AIX/transactions-trades/EUR-trans.txt

# ./run -p scripts/AIX/transactions-trades/new-trade2.txt

# roll BD

# echo
# echo DAY THREE
# echo

# ./run -p scripts/AIX/transactions-trades/create3-trans.txt
# ./run -p scripts/AIX/transactions-trades/GBP-trans.txt

# ./run -p scripts/AIX/transactions-trades/new-trade3.txt

# ./run -p scripts/AIX/settlement/settlement.txt

# roll BD

# echo 
# echo DAY FOUR
# echo 

# ./run -p scripts/AIX/transactions-trades/create-trans1.2.txt
# ./run -p scripts/AIX/transactions-trades/EUR-trans1.2.txt

# ./run -p scripts/AIX/transactions-trades/new-trade1.2.txt

# ./run -p scripts/AIX/settlement/settlement.txt

# roll BD

echo
echo DAY FIVE
echo

./run -p scripts/AIX/transactions-trades/create-trans.txt
./run -p scripts/AIX/transactions-trades/USD-trans.txt

./run -p scripts/AIX/transactions-trades/create2-trans.txt
./run -p scripts/AIX/transactions-trades/EUR-trans.txt

./run -p scripts/AIX/transactions-trades/create3-trans.txt
./run -p scripts/AIX/transactions-trades/GBP-trans.txt

./run -p scripts/AIX/transactions-trades/create-trans1.2.txt
./run -p scripts/AIX/transactions-trades/EUR-trans1.2.txt

./run -p scripts/AIX/transactions-trades/new-trade.txt
./run -p scripts/AIX/transactions-trades/new-trade1.2.txt
./run -p scripts/AIX/transactions-trades/new-trade2.txt
./run -p scripts/AIX/transactions-trades/new-trade3.txt

./run -p scripts/AIX/settlement/settlement.txt

# roll BD

# ./run -p scripts/AIX/settlement/settlement.txt

# roll BD

# ./run -p scripts/AIX/settlement/settlement.txt

