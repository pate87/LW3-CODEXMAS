// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

// Challenge #6
contract Challenge6{

    error TransferFailed();

    mapping (address => uint256) public balance;

    function send(uint256 _amount) external payable returns(uint256) {

        balance[msg.sender] += _amount;
        return balance[msg.sender];
    }

    function withdraw(uint256 _amount) external payable returns(bool) {
        require(balance[msg.sender] >= _amount, "You have not enough balance");
        
        balance[msg.sender] -= _amount;
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        if(!success) revert TransferFailed();

        return success;
    }
}

// https://sepolia.etherscan.io/address/0x5312ffb4811d4f467f232ae7b97c8bd8044b7b2d