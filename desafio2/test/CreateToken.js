const {ethers} = require("hardhat");
const assert = require("assert");
const {expect} = require("chai");

function errores(err, msg) {
    if (err) {
        console.log(msg);
        console.log(err);
    }
}

describe("CreateToken", function () {
    it('has initial message', async  () => {
        const [deployer] = await ethers.getSigners();
        const CreateTokenFactory = await ethers.getContractFactory("CreateToken");
        const CreateToken = await CreateTokenFactory.deploy();
        await CreateToken.deployed();
        await CreateToken.mint(deployer.address, 10);
        expect(await CreateToken.balanceOf(deployer.address)).to.equal(10);
        try {
            await CreateToken.mint(deployer.address, 10);
        } catch (e) {
            errores(e, "No se puede crear el token,no has esperado 100 minutos");
        }
    }
    );
});