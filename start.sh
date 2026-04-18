#!/bin/bash
geth --datadir ./data \
  --networkid 157541 \
  --dev \
  --dev.period 2 \
  --http --http.addr "0.0.0.0" \
  --http.api "eth,net,web3,personal,miner,debug,txpool" \
  --http.corsdomain "*" \
  --unlock "0xac5326869C3B7A989dB163d6b9a1A991D639d861" \
  --password ./password.txt \
  --allow-insecure-unlock
