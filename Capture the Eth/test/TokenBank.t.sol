// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { TokenBankAttack } from "foundry-CTE/src/attacks/TokenBankAttack.sol";

interface ITokenBankChallenge {
    function isComplete() external returns (bool);
}

contract TokenBankTest is Test {
    ITokenBankChallenge challenge;
    TokenBankAttack attacker;

    function setUp() public {
        TokenBankChallengeFactory factory = new TokenBankChallengeFactory();
        attacker = new TokenBankAttack();
        address challengeAddress = factory.createChallenge(address(attacker));
        challenge = ITokenBankChallenge(challengeAddress);
    }

    function test() public {
        attacker.setTarget(address(challenge));
        attacker.attack();

        assertTrue(challenge.isComplete());
    }
}