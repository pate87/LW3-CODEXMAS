// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract LW3XmasNFT is ERC1155, Ownable {

    error MaxNFTreached();

    // Max number of Snata NFT
    uint8 public maxWhitelistedAddresses;

    uint256 public constant SantaNFT = 1;

    // Track NFTs of address
    mapping (address => uint8) balance;

    constructor(address initialOwner, uint8 _maxWhitelistedAddresses) ERC1155("ipfs://QmSCFe5vvoPsSpyHZpGAW78GJ4bAuDcySCV9UnMm7B69iS/{id}.json") Ownable(initialOwner) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint256 id, uint256 amount, bytes memory data)
        public
    {   
        require(balance[msg.sender] < maxWhitelistedAddresses, "Max NFT images reached");
        balance[msg.sender]++;
        _mint(msg.sender, id, amount, data);
    }

    function getBalance() external view returns(uint8) {
        return balance[msg.sender];
    }

    // to Put NFT to Opensea
    function uri(uint256 _tokenId) override public view returns (string memory) {

        return string(
            abi.encodePacked(
                "ipfs://QmSCFe5vvoPsSpyHZpGAW78GJ4bAuDcySCV9UnMm7B69iS/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }
}