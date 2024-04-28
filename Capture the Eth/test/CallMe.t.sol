// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "../script/Contract.s.sol";
import {CallMe} from "../src/CallMe.sol";

contract CallMeTest is Script {
    CallMe callMe;
    address account1 = vm.addr(1);

    function setUp() public {
        callMe = new CallMe();
        vm.label(address(callMe), "CallMeChallenge");
        vm.label(account1, "Account 1");
    }

    function testCallMe() public {
        bool beforeResult;
        bool afterResult;

        vm.startPrank(address(account1));

        beforeResult = callMe.isComplete(); // test the inital state - should be false
        require(beforeResult == false);

        callMe.callme();

        afterResult = callMe.isComplete(); // test the state after - should be true
        require(afterResult == true);
    }
}
