// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { ValtheraSwapExecutor } from "../src/ValtheraSwapExecutor.sol";

contract Attacker {
    ValtheraSwapExecutor executor;

    constructor(ValtheraSwapExecutor _executor) {
        executor = _executor;
    }

    function tryExecuteSwap(address target, bytes calldata data, uint256 value) external {
        executor.executeSwap{value: value}(target, data, value);
    }

    function tryTransferOwnership(address newOwner) external {
        executor.transferOwnership(newOwner);
    }

    function tryWithdraw(address payable to, uint256 amount) external {
        executor.withdraw(to, amount);
    }

    function tryApproveTarget(address target) external {
        executor.approveTarget(target);
    }
}

contract ValtheraSwapExecutorTest {
    ValtheraSwapExecutor executor;
    Attacker attacker;

    address constant ZEROX_EXCHANGE = 0xDef1C0ded9bec7F1a1670819833240f027b25EfF;

    function setUp() public {
        executor = new ValtheraSwapExecutor();
        attacker = new Attacker(executor);
    }

    function testDeployment() public view {
        assert(address(executor) != address(0));
        assert(executor.owner() == address(this));
    }

    function testOwnerCanApproveTarget() public {
        executor.approveTarget(ZEROX_EXCHANGE);
        assert(executor.approvedTargets(ZEROX_EXCHANGE));
    }

    function testOwnerCanRevokeTarget() public {
        executor.approveTarget(ZEROX_EXCHANGE);
        executor.revokeTarget(ZEROX_EXCHANGE);
        assert(!executor.approvedTargets(ZEROX_EXCHANGE));
    }

    function testNonOwnerCannotApproveTarget() public {
        (bool success,) = address(attacker).call(
            abi.encodeWithSignature("tryApproveTarget(address)", ZEROX_EXCHANGE)
        );
        assert(!success);
    }

    function testTransferOwnership() public {
        executor.transferOwnership(address(0x1234));
        assert(executor.owner() == address(0x1234));
    }

    function testNonOwnerCannotTransferOwnership() public {
        (bool success,) = address(attacker).call(
            abi.encodeWithSignature("tryTransferOwnership(address)", address(0x5678))
        );
        assert(!success);
    }

    function testNonOwnerCannotExecuteSwap() public {
        executor.approveTarget(ZEROX_EXCHANGE);
        (bool success,) = address(attacker).call(
            abi.encodeWithSignature("tryExecuteSwap(address,bytes,uint256)", ZEROX_EXCHANGE, hex"00", 0)
        );
        assert(!success);
    }

    function testCannotExecuteUnapprovedTarget() public {
        (bool success,) = address(this).call(
            abi.encodeWithSignature("executeSwapUnapproved()")
        );
        assert(!success);
    }

    function executeSwapUnapproved() external {
        executor.executeSwap(address(0xdead), hex"00", 0);
    }

    function testReceiveEth() public {
        payable(address(executor)).transfer(1 ether);
        assert(address(executor).balance == 1 ether);
    }

    function testOwnerCanWithdraw() public {
        payable(address(executor)).transfer(1 ether);
        executor.withdraw(payable(address(0xdead)), 0.5 ether);
        assert(address(executor).balance == 0.5 ether);
    }

    function testNonOwnerCannotWithdraw() public {
        payable(address(executor)).transfer(1 ether);
        (bool success,) = address(attacker).call(
            abi.encodeWithSignature("tryWithdraw(address,uint256)", payable(address(0xdead)), 0.5 ether)
        );
        assert(!success);
    }

    function testCannotWithdrawToZeroAddress() public {
        (bool success,) = address(this).call(
            abi.encodeWithSignature("withdrawToZero()")
        );
        assert(!success);
    }

    function withdrawToZero() external {
        executor.withdraw(payable(address(0)), 1 ether);
    }

    function testCannotTransferToZeroAddress() public {
        (bool success,) = address(this).call(
            abi.encodeWithSignature("transferToZero()")
        );
        assert(!success);
    }

    function transferToZero() external {
        executor.transferOwnership(address(0));
    }
}
