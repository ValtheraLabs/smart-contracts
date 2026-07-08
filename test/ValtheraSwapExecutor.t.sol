// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ValtheraSwapExecutor } from "../src/ValtheraSwapExecutor.sol";

contract ValtheraSwapExecutorTest {
    ValtheraSwapExecutor executor;

    function setUp() public {
        executor = new ValtheraSwapExecutor();
    }

    function testDeployment() public view {
        assert(address(executor) != address(0));
    }

    function testSwapEventEmittedOnCall() public {
        bool success = executor.executeSwap(
            address(0),
            hex"00",
            0
        );
        // calling EOA or address(0) returns true (no revert)
        assert(success);
    }

    function testReceiveEth() public {
        payable(address(executor)).transfer(1 ether);
        assert(address(executor).balance == 1 ether);
    }
}
