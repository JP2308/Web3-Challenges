// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "../script/Contract.s.sol";
import {GuessTheNumberChallenge} from "../src/GuessTheNumber.sol";
import {Test} from "../../lib/forge-std/src/Test.sol";

contract GuessTheNumber is Test {
    GuessTheNumberChallenge guessTheNumberChallenge;

    address account1;
    address account2;

    function setUp() public {
        account1 = vm.addr(1);
        vm.label(account1, "Account1[address]");
        vm.deal(account1, 10 ether);

        guessTheNumberChallenge = new GuessTheNumberChallenge{value: 1 ether}();
        vm.label(
            address(guessTheNumberChallenge),
            "GuessTheNumberChallenge[contract]"
        );
        vm.startPrank(account1);
    }

    function testIncorrectGuess() public {
        // incorrect guess, costs 1 ether each
        guessTheNumberChallenge.guess{value: 1 ether}(41);
        guessTheNumberChallenge.guess{value: 1 ether}(43);

        uint expectedAccountBalance = 8 * (1 ether);
        assertEq((account1.balance), expectedAccountBalance);
        uint expectedContractBalance = 3 * (1 ether);
        assertEq(
            address(guessTheNumberChallenge).balance,
            expectedContractBalance
        );

        console.log(account1.balance);
        console.log(address(guessTheNumberChallenge).balance);
    }

    function testCorrectGuess() public {
        // correct guess, costs 1 ether, returns 2
        guessTheNumberChallenge.guess{value: 1 ether}(42);

        uint expectedAccountBalance = 11 * (1 ether);
        assertEq((account1.balance), expectedAccountBalance);
        uint expectedContractBalance = 0;
        assertEq(
            address(guessTheNumberChallenge).balance,
            expectedContractBalance
        );

        console.log(account1.balance);
        console.log(address(guessTheNumberChallenge).balance);
    }

    function testIsComplete() public {
        guessTheNumberChallenge.guess{value: 1 ether}(42);
        assertTrue(guessTheNumberChallenge.isComplete());

        console.log(account1.balance);
        console.log(address(guessTheNumberChallenge).balance);
    }

    fallback() external payable {}

    receive() external payable {}
}
