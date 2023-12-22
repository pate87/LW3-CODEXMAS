// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

contract Good {
    address public currentWinner;
    uint public currentAuctionPrice;

    error BidMustBeHigherThanCurrentBid();

    constructor() {
        currentWinner = msg.sender;
    }

    function setCurrentAuctionPrice() public payable {
        if(msg.value < currentAuctionPrice) {
            revert BidMustBeHigherThanCurrentBid();
        }

        (bool sent, ) = currentWinner.call{value: currentAuctionPrice}("");
        if (sent) {
            currentAuctionPrice = msg.value;
            currentWinner = msg.sender;
        }
  
    }
}

// https://sepolia.etherscan.io/address/0xcaba8ce6e064f95aeb1583c528a2ae3888195528#code