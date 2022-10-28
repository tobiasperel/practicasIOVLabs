const {ethers} = require("hardhat");
const assert = require("assert");
const {expect} = require("chai");
describe("CreateToken", function () {
    it('has initial message', async  () => {
        const [deployer] = await ethers.getSigners();
        const CreateTokenFactory = await ethers.getContractFactory("CreateToken");
        const CreateToken = await CreateTokenFactory.deploy();
        await CreateToken.deployed();
        expect(await CreateToken.balanceOf(deployer.address)).equal(100);
    }
    );
});