echo "-------------------------------------------------------------------"
echo -e "$YELLOW Enter PASSWORD for your KEY $NORMAL"
echo "-------------------------------------------------------------------"
read -s PASS


while true
do 
WALLET=plq1k6wjxd7h49jszmue80g4d7p6mx6n0ms7a7j8e5
BINARY=planqd
KEY_NAME=mdlog
VALOPER=plqvaloper1k6wjxd7h49jszmue80g4d7p6mx6n0ms7rqlal9
BAL=300000000000000000

echo $PASS | ${BINARY} tx distribution withdraw-rewards ${VALOPER} --commission --from ${WALLET} --gas auto --gas-adjustment 1.5 --chain-id=${CHAIN} --gas-prices="30000000000aplanq" --chain-id planq_7070-2 --from $WALLET

BALANCE=$(planqd q bank balances plq1k6wjxd7h49jszmue80g4d7p6mx6n0ms7a7j8e5 | grep "amount" | awk '{ print $3 }')
BALANCES=$BALANCE - $BAL

if  [ $BALANCES > 0 ]; then
echo $PASS | ${BINARY} tx staking delegate plqvaloper1k6wjxd7h49jszmue80g4d7p6mx6n0ms7rqlal9 ${BALANCES}aplanq --gas="1000000" --gas-prices="30000000000aplanq" --gas-adjustment="1.15" --chain-id planq_7070-2 --from $WALLET

else 
echo "-------------------------------------------------------------------"
        echo -e "$RED Insufficient balance for delegation $NORMAL"
        echo "-------------------------------------------------------------------"     
fi        
printf "sleep"
        for((sec=0; sec<1; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
