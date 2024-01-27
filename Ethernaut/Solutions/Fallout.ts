import { ethers } from "hardhat";

const CONTRACT_NAME = "Fallout";
///const CONTRACT_ADDRESS = "";

async function main() {
  const factory = await ethers.getContractFactory(CONTRACT_NAME);
  const contract = factory.attach(CONTRACT_ADDRESS);

  const tx = await contract.Fal1out();
  await tx.wait();
}

main().catch(error => {
  console.error(error);
  process.exit(1);
});