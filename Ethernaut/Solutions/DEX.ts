1. get the contract instance;
2. enter t1 = await contract.token1() - this would get the address for token 1;
3. enter t2 = await contract.token2() - again address for token 2;
4. now for the most important step - you'll have to conduct multiple swaps between currencies. Given that the price of swaps are governed inside the contract, rounding errors mean you will receive more tokens as you exchange them with the other token.
5. After you have completely drained token1 of its balances, use: await contract.balanceOf(t1, instance).then(v => v.toString()) to verify that the amount contained in the balance is 0;
6. submit the instance.