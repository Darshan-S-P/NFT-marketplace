// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarketplace is ERC721, Ownable {
    struct NFT {
        string name;
        string description;
        address owner;
        uint256 price;
        bool forSale;
    }

    mapping(uint256 => NFT) public nfts;

    uint256 public tokenCounter;

    constructor(string memory name, string memory symbol, address initialOwner) ERC721(name, symbol) Ownable(initialOwner) {
        tokenCounter = 0;
    }

    function createNFT(string memory _name, string memory _description, uint256 _price) public onlyOwner returns (uint256) {
        uint256 newItemId = tokenCounter;
        nfts[newItemId] = NFT({
            name: _name,
            description: _description,
            owner: owner(),
            price: _price,
            forSale: false
        });
        _safeMint(owner(), newItemId);
        tokenCounter++;
        return newItemId;
    }

    function listNFTForSale(uint256 _tokenId, uint256 _price) public {
        require(ownerOf(_tokenId) == msg.sender, "You don't own this NFT");
        nfts[_tokenId].forSale = true;
        nfts[_tokenId].price = _price;
    }

    function buyNFT(uint256 _tokenId) public payable {
        require(nfts[_tokenId].forSale, "NFT is not for sale");
        require(msg.value >= nfts[_tokenId].price, "Insufficient funds");
        address seller = ownerOf(_tokenId);
        _transfer(seller, msg.sender, _tokenId);
        nfts[_tokenId].forSale = false;
        payable(seller).transfer(msg.value);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }
}
