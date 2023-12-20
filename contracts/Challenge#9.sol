// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Challenge9_Random_Number {
    function getRandomNumber() public view returns (uint) {
       return uint(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, msg.sender))) % 10000;
   }
}

// https://sepolia.etherscan.io/address/0xebe03dd3be344decff9abb3b8c823a1f01cce9e2#readContract