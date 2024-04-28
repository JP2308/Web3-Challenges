// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { FuzzyIdentityAttack } from "../src/attacks/FuzzyIdentityAttack.sol";

interface IFuzzyIdentityChallenge {
    function isComplete() external returns (bool);
}

contract FuzzyIdentityTest is Test {
    IFuzzyIdentityChallenge challenge;

    function setUp() public {
        FuzzyIdentityChallengeFactory factory = new FuzzyIdentityChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IFuzzyIdentityChallenge(challengeAddress);
    }

    function test() public {
        // To calculate salt run 'forge script script/FuzzyIdentity.s.sol:FuzzyIdentityScript'
        FuzzyIdentityAttack attacker = (new FuzzyIdentityAttack){
            salt: 0x000000000000000000000000000000000000000000000000000000000014b8c8
        }();
        attacker.attack(address(challenge));

        assertTrue(challenge.isComplete());
    }
}