#!/bin/bash

while true
do

 faucet=$(namadac transfer --token NAM --amount 1000 --source faucet --target $VALIDATOR_ALIAS --signer $VALIDATOR_ALIAS)
 echo "Makassar"

   printf "sleep"
        for((sec=0; sec<1; sec++))
        do
                printf "echo $faucet"
                sleep 1
        done
        printf "\n"
done
