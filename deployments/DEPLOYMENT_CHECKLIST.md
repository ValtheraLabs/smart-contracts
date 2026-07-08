# Deployment Checklist

No deployment is approved by this checklist alone. Complete this record before any testnet or mainnet deployment, then store final deployment details in `deployments/`.

## Network

- Network name:
- Chain ID:
- RPC provider:
- Block explorer:
- Deployment environment:
- Fork or dry-run command:

## Addresses

- Contract name:
- Deployed address:
- Constructor arguments:
- Admin address:
- Multisig address:
- Treasury address:
- Recipient addresses:
- External dependency addresses:
- Address source and verification method:

## Verification

- Compiler version:
- Optimizer enabled:
- Optimizer runs:
- Source verified on explorer:
- Constructor arguments verified:
- Commit hash:
- Build artifact hash:
- ABI stored:
- Deployment transaction hash:

## Signer

- Deployment signer:
- Signer custody method:
- Signer balance checked:
- Signer permissions limited:
- Multisig threshold confirmed:
- Signer rotation plan documented:
- Private keys and seed phrases absent from repository and logs:

## Test Requirements

- `forge test` passed:
- Coverage reviewed:
- Failure-path tests passed:
- Access-control tests passed:
- Event tests passed:
- Fuzz or invariant tests passed where applicable:
- Fork tests passed where applicable:
- Static analysis completed:

## Review Requirements

- Product approval:
- Engineering review:
- Security review:
- Legal or compliance review when applicable:
- Threat model completed:
- External audit completed when material value is at risk:
- Open findings resolved or explicitly accepted:

## Rollback Requirements

- Pause plan:
- Emergency contact:
- Admin recovery path:
- Treasury recovery path:
- User communication plan:
- Known irreversible actions:
- Migration plan if redeployment is required:

## Record Requirements

- Deployment command:
- Deployment timestamp:
- Deployer:
- Reviewer:
- Transaction hash:
- Contract address:
- Explorer verification URL:
- Final ABI location:
- Final artifact location:
- Risk notes:
- Post-deployment monitoring owner:
- Incident response link:
