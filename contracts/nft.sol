// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, Ownable {
    uint256 public tokenCounter;

    constructor(string memory name, string memory symbol, address initialOwner) ERC721(name, symbol) Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT(address to) public onlyOwner returns (uint256) {
        uint256 newItemId = tokenCounter;
        _safeMint(to, newItemId);
        tokenCounter++;
        return newItemId;
    }
}
