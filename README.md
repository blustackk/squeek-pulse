# Squeek Pulse

Live dashboard for the [Squeekchain](https://squeekchain.com) stream-game on Sepolia.

https://squeek.blu-stack.com

One static page, no build step. It reads the public Squeekchain API every 30 seconds:

- `https://api.squeekchain.com/v1/core` — current round, block height, cumulative work, difficulty, latest `BatchSettled` and other core events
- `https://api.squeekchain.com/v1/economy/state` — SQK supply vs cap, launch-bonus and halving progress, staking totals, hamster NFT counts, contract identities

Every contract and transaction links to Sepolia Etherscan. Blocks-per-day and the bonus/halving countdowns are averages since the stream genesis timestamp.

## Run locally

Open `index.html` in a browser, or:

```
python3 -m http.server 8000
```

## Independent community tool

Not affiliated with the Squeekchain team. MIT licensed.
