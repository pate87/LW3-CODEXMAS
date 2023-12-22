const hre = require("hardhat");

async function main() {

  const contract = await hre.ethers.deployContract("Attack", ["0xcaBa8cE6E064f95AEB1583C528A2Ae3888195528"]);

  await contract.waitForDeployment();

  console.log("Deployed to: ", contract.target);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
