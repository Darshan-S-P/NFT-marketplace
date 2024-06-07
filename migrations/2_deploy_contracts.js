const NFT = artifacts.require("NFT");

module.exports = function (deployer) {
  const name = "MyNFT";
  const symbol = "MNFT";
  const initialOwner = "0xYourEthereumAddress"; // Replace with your Ethereum address
  deployer.deploy(NFT, name, symbol, initialOwner);
};
