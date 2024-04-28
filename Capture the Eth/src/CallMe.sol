// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract CallMe {
    bool public isComplete = false;

    function callme() public {
        isComplete = true;
    }
}
