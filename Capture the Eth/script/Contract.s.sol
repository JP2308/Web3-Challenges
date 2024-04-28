// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console} from "../lib/forge-std/src/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }
}
