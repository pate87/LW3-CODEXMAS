// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken is ERC20, Ownable, ERC20Permit {

    constructor(uint256 _amount)
        ERC20("LW3_Xmas", "LW3X")
        Ownable(msg.sender)
        ERC20Permit("LW3_Xmas")

    {
        mint(msg.sender, _amount);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}

// |https://sepolia.etherscan.io/address/0xa75ff6455f32b5ce4182b6f0e87ac6dbe2b162f2