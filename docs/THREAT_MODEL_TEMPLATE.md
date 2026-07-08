# Threat Model Template

Use this template before implementing or deploying any smart contract. Keep completed threat models with deployment records.

## Scope

- Contract or module name:
- Version or commit:
- Network:
- Purpose:
- Explicit non-goals:
- Related documents:

## Assets

- Native tokens held:
- ERC-20 tokens held:
- Accounting balances:
- Admin roles:
- Treasury addresses:
- Event data:
- Off-chain records referenced by hash:
- User funds or user-facing balances:

## Actors

- End users:
- Admins:
- Multisig signers:
- Treasury operators:
- Backend services:
- Keepers or automation:
- External protocols:
- Attackers:
- Auditors and reviewers:

## Trust Assumptions

- Admin key custody:
- Multisig threshold and signer independence:
- Treasury address ownership:
- Backend input integrity:
- External token behavior:
- External protocol behavior:
- Oracle or data-source assumptions:
- Chain finality and reorg assumptions:
- User-interface assumptions:

## Failure Modes

- Unauthorized admin action:
- Compromised signer:
- Incorrect recipient address:
- Failed token transfer:
- Reentrancy:
- Rounding or dust loss:
- Stuck funds:
- Duplicate or replayed action:
- Denial of service:
- Incorrect event data:
- Privacy leak through calldata or events:
- External dependency failure:
- Chain-specific behavior mismatch:

## Admin Powers

List each privileged action. Include caller, delay, guardrail, event, and rollback path.

| Power | Authorized caller | Delay | Guardrail | Event | Rollback |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

## Tests

Required before deployment consideration:

- Unit tests for happy paths.
- Unit tests for failure paths.
- Access-control tests for every admin function.
- Event emission tests for critical actions.
- Boundary tests for zero values, maximum values, zero addresses, duplicates, and unsupported assets.
- Reentrancy tests where funds move.
- Fuzz tests for accounting or allocation logic.
- Invariant tests for custody, balances, and accounting conservation when applicable.
- Fork tests only when integration with deployed protocols is necessary.
- Static analysis output attached to review record.

## Deployment Gates

- Product need approved.
- Legal or compliance review completed if value, fees, tokens, or regulated activity are involved.
- Threat model completed and reviewed.
- Contract implementation reviewed by at least two engineers.
- Tests pass locally and in CI.
- Static analysis completed with findings resolved or accepted.
- External audit completed when material value is at risk.
- Deployment checklist completed.
- Signer, multisig, and treasury addresses verified out of band.
- Rollback or pause plan documented.
- Monitoring and incident response plan documented.

## Residual Risks

- Accepted risks:
- Open questions:
- Follow-up work:
- Decision owner:
- Review date:
