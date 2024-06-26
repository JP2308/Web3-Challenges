// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "../script/Contract.s.sol";
import {GuessTheRandomNumberChallenge} from "../src/GuessTheRandomNumber.sol";
import {Test} from "../../lib/forge-std/src/Test.sol";

contract GuessTheRandomNumberTest is Test {
    GuessTheRandomNumberChallenge guessTheRandomNumberChallenge;

    address account1;
    address account2;
    uint8 answer;

    //setup an account with funds to ensure function doesn't revert
    function setUp() public {
        account1 = vm.addr(1);
        vm.label(account1, "Account1[address]");
        vm.deal(account1, 10 ether);

        guessTheRandomNumberChallenge = new GuessTheRandomNumberChallenge{
            value: 1 ether
        }();
        vm.label(
            address(guessTheRandomNumberChallenge),
            "GuessTheRandomNumberChallenge[contract]"
        );
        vm.startPrank(account1);
        //answer = crackRandom();

        // since everything is public, we literally look to the 'random' number from the chain
        // the .vm.load command is loading the storage slot 0, we only have one variable an uint8...guess what that is
        answer = uint8(
            uint256(vm.load(address(guessTheRandomNumberChallenge), 0))
        );

        //console.log(address(guessTheRandomNumberChallenge));
        //console.log(answer);
    }

    //extra measures to ensure that the script is running how we want it to
    function testIncorrectGuess() public {
        // incorrect guess, costs 1 ether each
        guessTheRandomNumberChallenge.guess{value: 1 ether}(1);
        guessTheRandomNumberChallenge.guess{value: 1 ether}(43);

        uint expectedAccountBalance = 8 * (1 ether);
        assertEq((account1.balance), expectedAccountBalance);
        uint expectedContractBalance = 3 * (1 ether);
        assertEq(
            address(guessTheRandomNumberChallenge).balance,
            expectedContractBalance
        );

        console.log(account1.balance);
        console.log(address(guessTheRandomNumberChallenge).balance);
    }

    function testCorrectGuess() public {
        // correct guess, costs 1 ether, returns 2
        guessTheRandomNumberChallenge.guess{value: 1 ether}(answer);

        uint expectedAccountBalance = 11 * (1 ether);
        assertEq((account1.balance), expectedAccountBalance);
        uint expectedContractBalance = 0;
        assertEq(
            address(guessTheRandomNumberChallenge).balance,
            expectedContractBalance
        );

        console.log(answer);
        console.log(account1.balance);
        console.log(address(guessTheRandomNumberChallenge).balance);
    }

    function testIsComplete() public {
        console.log(answer);

        guessTheRandomNumberChallenge.guess{value: 1 ether}(answer);
        assertTrue(guessTheRandomNumberChallenge.isComplete());

        console.log(account1.balance);
        console.log(address(guessTheRandomNumberChallenge).balance);
    }

    fallback() external payable {}

    receive() external payable {}
}
