//GateOne
//See previous challenges I've completed for further explanation but basically I set up another contract as the owner, and we (an EOA) will be the tx.origin - so this condition is satisfied.

//GateTwo
await web3.eth.getStorageAt(“whateverContractAddressIs”, 2, console.log)
// Now Run the getAllowance function with the hex number we got from reading the storage.

//GateThrer
//Satisfy two conditions: 1) balance of the current contract > 0.001 ether and sending 0.001 ether to the owner of the contract must revert.
//To satisfy the first condition - send a small balance of ether to the contract so that address(this).balance > 0.001 ether will be true.
//Call the construct0r() function, so that it will become the msg.sender and also ensure that you have specified a function to call the enter() (we then become become the tx.origin), and msg.sender is this new contract.