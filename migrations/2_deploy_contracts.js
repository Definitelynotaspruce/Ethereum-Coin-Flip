var CoinFlip = artifacts.require("CoinFlip");
var Adoption = artifacts.require("Adoption");

module.exports = function(deployer) {
  deployer.deploy(Adoption);
  deployer.deploy(CoinFlip);
};