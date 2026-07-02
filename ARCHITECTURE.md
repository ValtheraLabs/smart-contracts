# Smart Contract Architecture

## Role

The smart-contracts repository should contain only on-chain components that are necessary for Valthera's product utility.

## Initial Design Assumption

The MVP should integrate proven DeFi infrastructure for swaps and routing instead of building custom liquidity pools from zero.

## Potential Contract Areas

```text
smart-contracts
├── token/          # future utility token, if approved
├── fees/           # fee routing and accounting
├── treasury/       # treasury management
├── staking/        # access or incentive staking, if justified
├── governance/     # governance, if justified later
├── scripts/        # deployment scripts
├── test/           # tests
└── docs/           # deployment records and security notes
```

## Design Principles

- Keep contracts minimal.
- Prefer composition over monolithic systems.
- Avoid storing unnecessary user data on-chain.
- Avoid admin powers unless absolutely necessary.
- Document every privileged role.
- Write tests for failure paths, not only happy paths.

## Deployment Principle

Every deployment must include:

- Chain ID
- Contract address
- Compiler version
- Commit hash
- Constructor arguments
- Deployment wallet/multisig
- Verification status
- Risk notes
