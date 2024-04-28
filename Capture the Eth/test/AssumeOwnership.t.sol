// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {AssumeOwnershipChallenge} from "foundry-CTE/src/AssumeOwnership.sol";

describe("AssumeOwnershipChallenge", () => {
  it("Solves the challenge", async () => {
    const [deployer] = getWallets();
    const contract = await deployContract(deployer, AssumeOwnershipChallenge);

    let tx;
    tx = await contract.AssumeOwmershipChallenge();
    await tx.wait();

    tx = await contract.authenticate();
    await tx.wait();

    expect(await contract.isComplete()).to.be.true;
  });
});
