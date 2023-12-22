const hre = require("hardhat");

async function main() {

  const goodContract = await hre.ethers.deployContract("Good");

  await goodContract.waitForDeployment();

  console.log("Deployed to: ", goodContract.target);

  const contract = await hre.ethers.deployContract("Attack", [goodContract.target]);

  await contract.waitForDeployment();

  console.log("Deployed to: ", contract.target);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
