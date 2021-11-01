require("@nomiclabs/hardhat-waffle");
require('dotenv').config();



module.exports = {
  solidity: "0.8.4",
  networks: {
    rinkeby: {
      url: 'https://eth-rinkeby.alchemyapi.io/v2/piDldoOhc8ML56f4BRIwxglGic9k7gn1',
      accounts: ['f6a699afb7152c7e99d1f53412b9a5fb94a6ce6a59841240d7aa162670ee4ad8'],
    },
    mainnet: {
      chainId: 1,
      url: 'https://eth-mainnet.alchemyapi.io/v2/piDldoOhc8ML56f4BRIwxglGic9k7gn1',
      accounts: ['f6a699afb7152c7e99d1f53412b9a5fb94a6ce6a59841240d7aa162670ee4ad8'],
    },
  },
};
