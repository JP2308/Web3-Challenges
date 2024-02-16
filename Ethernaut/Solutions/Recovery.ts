pragma solidity ^0.8;

interface ISimpleToken {
    function name() external view returns (string memory);
    function destroy(address to) external;
}

interface IRecovery {}

contract Dev {
    function recover(address sender) external pure returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), sender, bytes1(0x01)));
        address addr = address(uint160(uint256(hash)));
        return addr;
    }
}

// after deploying the above, make sure to enter SimpleToken's address such that the destroy function takes this address and returns the ETH contained into it
// back to the EOA 