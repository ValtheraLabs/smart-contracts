# Contract Roadmap

## Status

Valthera smart contracts are roadmap and security documentation only. This file does not approve implementation, deployment, or production use of any Solidity financial logic.

Do not add token, staking, governance, fee router, upgradeability, testnet deployment, or mainnet deployment code without separate product, legal, security, and engineering approval.

## Candidate Module: Event-Only Audit Log

### Purpose

Emit public events for critical off-chain actions that need tamper-evident auditability.

### Possible Uses

- Record governance-free operational milestones.
- Record public attestations for reviewed releases.
- Record hashes of signed off-chain reports or deployment records.

### Non-Goals

- No custody.
- No balances.
- No token logic.
- No permissioned financial execution.
- No user profile or sensitive data storage.

### Review Gates

- Prove event-only logging adds value beyond signed off-chain records.
- Define exact event schema and privacy review.
- Test event emission, access controls, duplicate records, and malformed input.
- Confirm no sensitive data is emitted.

## Candidate Module: Simple Fee Splitter

### Purpose

Split received funds among fixed recipients using transparent, reviewable rules.

### Possible Uses

- Small fixed recipient set.
- Stable allocation percentages.
- Minimal accounting surface.

### Non-Goals

- No dynamic fee routing.
- No yield handling.
- No staking rewards.
- No governance-controlled allocation changes.
- No upgradeable splitter.

### Review Gates

- Prove off-chain invoicing or existing splitter infrastructure is insufficient.
- Document recipients, shares, admin powers, and change process.
- Test rounding, dust, zero address handling, duplicate recipients, failed transfers, and emergency paths.
- Complete internal review before any external audit request.

## Candidate Module: Pull-Based Fee Collector

### Purpose

Collect protocol fees without pushing funds during user-critical flows. Authorized recipients withdraw owed balances explicitly.

### Possible Uses

- Reduce transfer failure coupling.
- Keep fee settlement auditable.
- Allow recipient-controlled withdrawals.

### Non-Goals

- No custody beyond minimal pending balances.
- No arbitrary swap execution.
- No token issuance.
- No staking, incentives, or governance distribution.
- No hidden fee formulas.

### Review Gates

- Define when fees accrue and who can record accruals.
- Document supported assets and treasury recipient rules.
- Test accounting invariants, reentrancy protection, paused withdrawals, permission boundaries, and stuck-token recovery.
- Add fuzz or invariant tests before production consideration.

## Candidate Module: Treasury Integration

### Purpose

Route approved funds to a documented treasury destination, usually a multisig, with clear records and limited privileges.

### Possible Uses

- Multisig-controlled fee collection.
- Public treasury address registry.
- Documented transfer flows from reviewed contracts.

### Non-Goals

- No investment strategy execution.
- No automated trading.
- No governance treasury.
- No upgradeable treasury module.
- No private-key or signer management in contracts.

### Review Gates

- Confirm treasury custody model and signer responsibilities.
- Document emergency response, signer rotation, and recovery process.
- Test address changes, unauthorized updates, event records, and rollback procedures.
- Require deployment checklist completion before any network deployment.

## Cross-Cutting Requirements

- Keep contracts minimal and purpose-specific.
- Prefer existing audited infrastructure when it satisfies product needs.
- Avoid upgradeability unless a separate risk memo proves need.
- Document every privileged role and admin action.
- Require tests for failure paths, not only happy paths.
- Require static analysis and human review before deployment.
- Require external audit when material value is at risk.
