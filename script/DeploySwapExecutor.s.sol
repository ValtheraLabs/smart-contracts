// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ValtheraSwapExecutor } from "../src/ValtheraSwapExecutor.sol";

/// @notice PRE-AUDIT — not for mainnet deployment.
///         Run: forge script script/DeploySwapExecutor.s.sol --rpc-url <rpc> --broadcast
///         After deploy: call approveTarget with known DEX router addresses.
contract DeploySwapExecutorScript {
    function run() external {
        new ValtheraSwapExecutor();
    }
}
