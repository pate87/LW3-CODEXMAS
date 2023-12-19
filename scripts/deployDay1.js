const hre = require("hardhat");

async function main() {

  const contract = await hre.ethers.deployContract("LW3_ChristmasSmartContract_1");

  await contract.waitForDeployment();

  console.log("Deployed to: ", contract.target);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
