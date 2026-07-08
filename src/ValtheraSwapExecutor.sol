// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title ValtheraSwapExecutor
/// @notice Executes DEX swap calldata with owner access control + reentrancy protection.
/// @dev PRE-AUDIT — NOT for mainnet deployment.
///      MVP uses direct wallet-to-DEX transactions via 0x API calldata.
///      This contract is an optional safety wrapper for future use.
contract ValtheraSwapExecutor {
    address public owner;
    bool private _locked;

    mapping(address => bool) public approvedTargets;

    event SwapRecorded(
        address indexed user,
        address indexed target,
        bytes32 dataHash,
        uint256 value,
        uint256 timestamp
    );

    event OwnerUpdated(address indexed previousOwner, address indexed newOwner);
    event TargetApproved(address indexed target);
    event TargetRevoked(address indexed target);

    modifier onlyOwner() {
        require(msg.sender == owner, "ValtheraSwapExecutor: only owner");
        _;
    }

    modifier nonReentrant() {
        require(!_locked, "ValtheraSwapExecutor: reentrant call");
        _locked = true;
        _;
        _locked = false;
    }

    constructor() {
        owner = msg.sender;
        emit OwnerUpdated(address(0), msg.sender);
    }

    /// @notice Execute DEX calldata with owner auth + reentrancy protection.
    function executeSwap(address target, bytes calldata data, uint256 value)
        external
        payable
        onlyOwner
        nonReentrant
        returns (bool)
    {
        require(approvedTargets[target], "ValtheraSwapExecutor: target not approved");

        (bool success, bytes memory ret) = target.call{value: value}(data);
        if (!success) {
            assembly { revert(add(ret, 32), mload(ret)) }
        }

        emit SwapRecorded(msg.sender, target, keccak256(data), value, block.timestamp);
        return true;
    }

    /// @notice Approve a DEX target contract.
    function approveTarget(address target) external onlyOwner {
        require(target != address(0), "ValtheraSwapExecutor: zero address");
        approvedTargets[target] = true;
        emit TargetApproved(target);
    }

    /// @notice Revoke a DEX target contract.
    function revokeTarget(address target) external onlyOwner {
        approvedTargets[target] = false;
        emit TargetRevoked(target);
    }

    /// @notice Transfer ownership.
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "ValtheraSwapExecutor: zero address");
        emit OwnerUpdated(owner, newOwner);
        owner = newOwner;
    }

    /// @notice Withdraw ETH from contract.
    function withdraw(address payable to, uint256 amount) external onlyOwner {
        require(to != address(0), "ValtheraSwapExecutor: zero address");
        to.transfer(amount);
    }

    receive() external payable {}
}
