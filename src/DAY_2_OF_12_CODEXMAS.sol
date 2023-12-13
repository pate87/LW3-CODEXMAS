// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract LW3_ChristmasSmartContract_2 {

    function getText(string memory _text) external pure returns(string memory) {
         return string.concat(_text, " ", "Merry Christmas!");
    }
}

// https://sepolia.etherscan.io/address/0x6c73340c3e0c3e836357ffe9f23f247e890ac5d1