const FruitList = artifacts.require("Fruits.sol");

module.exports = function (deployer) {
  deployer.deploy(FruitList);
};
