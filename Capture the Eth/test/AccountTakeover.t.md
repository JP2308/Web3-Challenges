Foundry not required, follow the below steps:

Tx Id 1;
0x061bf0b4b5fdb64ac475795e9bc5a3978f985919ce6747ce2cfbbcaccaf51009
s1 = 0x2bbd9c2a6285c2b43e728b17bda36a81653dd5f4612a2e0aefdb48043c5108de
z1 = 0x4f6a8370a435a27724bbc163419042d71b6dcbeb61c060cc6816cda93f57860c

Tx Id 2: 0xd79fc80e7b787802602f3317b7fe67765c14a7d40c3e0dcb266e63657f881396
s2 = 0x7724cedeb923f374bef4e05c97426a918123cc4fec7b07903839f12517e1b3c8
z2 = 0x350f3ee8007d817fbd7349c477507f923c4682b3e69bd1df5fbb93b39beb1e04

Common r value: 0x69a726edfb4b802cbf267d5fd1dabcea39d3d7b4bf62b9eeaeba387606167166

There is a method to derive private keys where the nonce k is reused with the values above. 


Testing the private keys, we will find one of them allowing us access to address 0x6B477781b0e68031109f21887e6B5afEAaEB002b.

We call function authenticate() using the private keys to the aforementioned address, setting isComplete to true and completing the challenge.