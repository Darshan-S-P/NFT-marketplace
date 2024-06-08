module.exports = {
  // Other configuration...
  compilers: {
    solc: {
      version: "0.8.20", // Specify the Solidity version you're using
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  }
};
