const {ethers} = require("hardhat");
const assert = require("assert");

describe("HelloWorld", function () {
    it('has initial message', async  () => {
        const HelloWorldFactory = await ethers.getContractFactory("HelloWorld");
        msg = "Hello mundo profencional" 
        const helloWorld = await HelloWorldFactory.deploy(msg);
        await helloWorld.deployed();
        assert.equal(await helloWorld.getMessage(),msg);
    }
    );
});