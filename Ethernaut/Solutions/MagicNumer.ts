var account = "your address here";
var bytecode = "0x600a600c600039600a6000f3604260805260206080f3";
web3.eth.sendTransaction({ from: account, data: bytecode }, function(err,res){console.log(res)});


see related post by JarrodP on Ethernaut Forum day 32 on bytecode and how I arrived at the var bytecode