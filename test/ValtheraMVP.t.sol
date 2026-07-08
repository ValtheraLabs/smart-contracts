// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ValtheraMVP } from "../src/ValtheraMVP.sol";

contract ValtheraMVPTest {
    function testNameIsSet() public {
        ValtheraMVP target = new ValtheraMVP();
        assert(
            keccak256(bytes(target.NAME()))
                == keccak256(bytes("Valthera MVP - SwapExecutor deployed"))
        );
    }

    function testVersionIsSet() public {
        ValtheraMVP target = new ValtheraMVP();
        assert(
            keccak256(bytes(target.VERSION()))
                == keccak256(bytes("0.1.0"))
        );
    }
}
