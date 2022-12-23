var NFTToken = artifacts.require("INANINFT");
var engine = artifacts.require("Engine");

module.exports = function(deployer) {
    deployer.deploy(NFTToken, "INANI DEV321", "INANI DESCRIPT");
    deployer.deploy(engine);
};