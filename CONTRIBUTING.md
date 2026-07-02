# Contributing to Valthera Smart Contracts

## Development Rules

- Use explicit Solidity versions.
- Prefer OpenZeppelin contracts for standard primitives.
- Keep contracts small and auditable.
- Add tests for every contract change.
- Add failure-case tests.
- Run static analysis before review.

## PR Requirements

Every smart contract PR should include:

- What changed
- Why on-chain logic is needed
- Tests added
- Security considerations
- Gas or storage implications
- Deployment implications

## Prohibited Without Approval

- Mainnet deployments
- Token deployment
- Upgradeable proxies
- Admin minting rights
- Custodial user fund flows
- Unreviewed external calls
