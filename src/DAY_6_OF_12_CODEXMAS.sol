// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract Challenge6{

    event Withdraw (address index, uint256 amount);
    error TransferFailed();

    bool internal locked;
    modifier noReentrant() {
        require(!locked, "You're locked");
        locked = true;
        _;
        locked = false;
    }


    mapping (address => uint256) balance;

    function send(uint256 _amount) external payable returns(uint256) {

        balance[msg.sender] += _amount;
        return balance[msg.sender];
    }

    function getBalance() external view returns(uint256) {
        return balance[msg.sender];
    }

    function withdraw(uint256 amount) external payable noReentrant {
        require(balance[msg.sender] >= amount, "You have not enough balance");
        
        balance[msg.sender] -= amount;
        (bool success, ) = payable(msg.sender).call{value: amount}("");
        if(!success) revert TransferFailed();

        emit Withdraw (msg.sender, amount);

    }

    receive() external payable { }

}

// https://sepolia.etherscan.io/address/0x5312ffb4811d4f467f232ae7b97c8bd8044b7b2d