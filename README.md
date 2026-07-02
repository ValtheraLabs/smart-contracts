# Valthera Smart Contracts

The smart-contracts repository contains Valthera on-chain infrastructure, tests, deployment scripts, and security documentation.

## Purpose

Build secure, reviewed, and testable Solidity components for the Valthera ecosystem.

## MVP Scope

The MVP should avoid unnecessary custom financial primitives. Smart contracts should be introduced only where they create clear product utility.

Initial areas of research:

- Fee routing contracts
- Treasury contracts
- Utility token design, if approved later
- Staking or access contracts, only if justified
- Governance contracts, only after product validation

## Preferred Stack

- Solidity ^0.8.24
- Foundry
- OpenZeppelin
- Slither
- Fuzz/invariant testing where appropriate

## Setup

Install Foundry:

```sh
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

Clone the repository and run the test suite:

```sh
git clone https://github.com/ValtheraLabs/smart-contracts.git
cd smart-contracts
forge test
```

For local environment variables, copy `.env.example` to `.env` and keep real RPC URLs, API keys, private keys, and seed phrases out of version control.

## Project Structure

```text
smart-contracts/
├── foundry.toml
├── src/
├── test/
├── script/
├── deployments/
├── docs/
└── .env.example
```

The current Solidity contract is a non-financial placeholder for validating the Foundry skeleton. The MVP does not include a token contract, mainnet deployment scripts, private keys, real RPC secrets, or unaudited financial logic.

See `docs/ONCHAIN_SCOPE.md` for the MVP on-chain scope.

## Security Rule

No contract should be deployed to mainnet without tests, review, static analysis, and a documented deployment plan.

## First Milestone

Create a minimal Foundry project with test scaffolding, deployment documentation, security checklist, and placeholder contracts only after design approval.
