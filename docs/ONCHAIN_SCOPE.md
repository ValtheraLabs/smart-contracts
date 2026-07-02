# Valthera MVP On-Chain Scope

## What Should Be On-Chain

For the Valthera MVP, on-chain code should be limited to components that provide clear product utility and cannot be handled safely off-chain.

Appropriate MVP candidates include:

- Minimal payment or fee routing only if the product needs transparent settlement.
- Treasury custody only if funds must be held by a reviewed contract or multisig-controlled flow.
- Event emission for critical state transitions that need public auditability.
- Permission boundaries that cannot be enforced reliably by the application layer.

Every contract should have a documented purpose, tests, privileged-role notes, and a deployment record before any production deployment.

## What Should Stay Off-Chain

The MVP should keep the following off-chain unless a later design review proves otherwise:

- User profiles, preferences, and non-essential metadata.
- Matching, recommendations, scoring, ranking, or business rules that need frequent iteration.
- Analytics, reporting, admin dashboards, and operational workflows.
- Sensitive data, private customer information, and proprietary strategy.
- Complex fee calculations that can be computed and verified before settlement.

Keeping these systems off-chain reduces gas costs, preserves user privacy, and lets the product iterate without contract migrations.

## Why Token Launch Is Not Part Of MVP

The MVP does not include a token contract or token launch. A token would add regulatory, economic, security, liquidity, governance, and operational risk before the product has proven that a token is necessary.

Launching a token too early can also distort product feedback. Users may engage for speculation instead of utility, making it harder to validate the core Valthera experience.

## Future Fee Router Options

Future fee routing should be considered only after the MVP proves that on-chain settlement is needed.

Possible options include:

- No custom router: use existing payment, swap, or settlement infrastructure.
- Minimal pull-based fee collector with explicit recipient configuration.
- Splitter-style router for fixed recipients and transparent accounting.
- Upgradeable router only if upgrade risk is justified and governance is mature.
- Chain-specific routers if supported networks have materially different requirements.

Any fee router must avoid hidden custody risk, unclear admin powers, and untested financial paths.

## Future Treasury Options

Treasury design should begin with the least complex option that satisfies custody and operational needs.

Possible options include:

- Externally owned account for development-only testing.
- Multisig treasury for MVP or early production custody.
- Timelocked treasury operations for sensitive actions.
- Contract treasury with strict, tested withdrawal rules.
- Governance-controlled treasury only after governance itself is justified.

Treasury authority, signer responsibilities, emergency processes, and recovery paths must be documented before funds are held.

## Future Utility Token Decision Gates

A utility token should be reconsidered only if several gates are met:

- The product has a validated use case that benefits from a token.
- The token has utility beyond fundraising or speculation.
- Off-chain access control, subscriptions, or credits are insufficient.
- Legal and compliance review supports the design.
- Token economics are documented and stress-tested.
- Security review covers minting, burning, permissions, distribution, and integrations.
- Operations can support monitoring, incident response, and user communication.

Until those gates are met, no token contract should be added.

## Security Risks Of Unnecessary Contracts

Unnecessary contracts create permanent risk:

- Bugs can lock or lose funds.
- Admin keys can become high-value targets.
- Upgrade paths can introduce governance or ownership failures.
- Integrations can inherit external protocol risk.
- Public code can expose incomplete business logic.
- Extra contracts increase audit scope and maintenance burden.
- Immutable mistakes may require migrations that harm users and trust.

The safest MVP contract is often the one that does not need to exist. Valthera should add on-chain components only when the benefit is specific, necessary, and reviewable.
