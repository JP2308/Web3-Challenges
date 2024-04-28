// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { PublicKeyChallengeFactory } from "../src/challenges/17_PublicKey/PublicKeyChallengeFactory.sol";

interface IPublicKeyChallenge {
    function isComplete() external returns (bool);

    function authenticate(bytes memory publicKey) external;
}

contract PublicKeyTest is Test {
    IPublicKeyChallenge challenge;

    function setUp() public {
        PublicKeyChallengeFactory factory = new PublicKeyChallengeFactory();
        address challengeAddress = factory.createChallenge();
        challenge = IPublicKeyChallenge(challengeAddress);
    }

    function test() public {
        // Not sure how to solve properly since Ropsten testnet was deprecated
        bytes memory publicKey = vm.parseBytes(
            "0x613a8d23bd34f7e568ef4eb1f68058e77620e40079e88f705dfb258d7a06a1a0364dbe56cab53faf26137bec044efd0b07eec8703ba4a31c588d9d94c35c8db4"
        );
        challenge.authenticate(publicKey);

        assertTrue(challenge.isComplete());
    }
}