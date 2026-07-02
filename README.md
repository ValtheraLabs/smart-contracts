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

- Solidity
- Foundry
- OpenZeppelin
- Slither
- Fuzz/invariant testing where appropriate

## Security Rule

No contract should be deployed to mainnet without tests, review, static analysis, and a documented deployment plan.

## First Milestone

Create a minimal Foundry project with test scaffolding, deployment documentation, security checklist, and placeholder contracts only after design approval.
