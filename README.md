# Squeek Pulse

Non-custodial holder tool for [Squeekchain](https://squeekchain.com) on Sepolia.

https://squeek.blu-stack.com

Connect a wallet and the page reads your position straight from the Squeekchain contracts:

- **Your position**: NFT power and SQK power (`accountPower`), share of network power, staked and fresh principal (`stakeOf`), claimable rewards, SQK balance.
- **Your Squeeks**: every Squeek in your wallet or deposited in the staking vault, found from `Transfer` and `Deposited` logs (via the Blockscout log index, since public Sepolia RPCs prune old logs) and confirmed on-chain with `ownerOf` / `depositor`. Each row shows level, base power and merge cooldown.
- **Power planner**: what your power and share become if you add SQK or Squeeks. Quotes come from `quotePower` and `basePower` on the live staking contract, not a copied formula.
- **Actions**, each a transaction you sign yourself: approve and `stake`, `claim`, `claimAndStake`, `unstake` with an on-chain `quoteUnstake` fee preview and a 5 % fee ceiling, `deposit` / `withdraw` Squeeks to and from the vault, and `merge` (collection) or `mergeDeposited` (vault) with level and cooldown checks before you sign.
- **Chain pulse**: current round, block height, difficulty, supply, total staked and network power from the public API.

One static page, no build step, no backend, no keys. Uses ethers v6 from cdnjs and the public Sepolia RPC at publicnode for reads; writes go through your injected wallet.

Contracts (Sepolia): Squeek NFT `0xcb98349c134ab983da5bfd80527dfe2552bdb70f`, staking vault `0x4b67b739dfd832f4eac67a7aa3bc244fb74cea4f`, SQK `0x5501e1fa81be1c3f49225fa7668da0245d07db60`.

## Run locally

```
python3 -m http.server 8000
```

## Independent community tool

Not affiliated with the Squeekchain team. MIT licensed.

squeekchain-project: 9f0a23a3-c025-4f7a-a02d-ed2a7a36dca3
