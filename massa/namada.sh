#!/bin/bash

while true
do
cd $HOME/namadexer/
make run_indexer
printf "sleep"
         for((sec=0; sec<60; sec++))
         do
                printf "."
                sleep 1
         done
         printf "\n"
 done
