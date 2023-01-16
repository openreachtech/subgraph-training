const ERC20 = artifacts.require("BeginnerCoin");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(ERC20);
  
  console.log("start minting erc20...")
  const erc20 = await ERC20.at(ERC20.address);
  await erc20.mint(accounts[0], "100000000000000000000");
  // for (let i = 0; i < accounts.length; i++) {
  //   await erc20.mint(accounts[i], "100000000000000000000");
  // }
};
