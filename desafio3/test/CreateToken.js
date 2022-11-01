const {ethers} = require("hardhat");
const assert = require("assert");
const {expect} = require("chai");

function errores(err, msg) {
    if (err) {
        console.log(msg);
        console.log(err);
    }
}

async function tryToMint (account, amount,msg) {
    try {
        await CreateToken.mint(account, amount);
    } catch (e) {
        errores(e, msg);
    }
}

describe("CreateToken", function () {
    it('has initial message', async  () => {
        const [deployer] = await ethers.getSigners();
        const CreateTokenFactory = await ethers.getContractFactory("CreateToken");
        const CreateToken = await CreateTokenFactory.deploy();
        await CreateToken.deployed();

        // //desafio1

        expect(await CreateToken.balanceOf(deployer.address)).equal(100);
        CreateToken.transfer("0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199", 22);
        CreateToken.transfer("0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", 10);
        CreateToken.transfer("0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", 37);
        expect(await CreateToken.balanceOf(deployer.address)).equal(31);
        expect(await CreateToken.balanceOf("0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199")).equal(22);
        expect(await CreateToken.balanceOf("0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2")).equal(10);
        expect(await CreateToken.balanceOf("0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db")).equal(37);
        
        // //desafio2

        // await CreateToken.mint(deployer.address, 10);
        // expect(await CreateToken.balanceOf(deployer.address)).to.equal(41);
        // tryToMint(deployer.address, 10, "No se puede crear el token,no has esperado 100 minutos");
        // expect(await CreateToken.seeTimeMinute()).to.equal(100);
        // await CreateToken.changeTimeMinute(1);
        // expect(await CreateToken.seeTimeMinute()).to.equal(1);

        //desafio3  
        const PayMethodFactory = await ethers.getContractFactory("PayMethod");
        const PayMethod = await PayMethodFactory.deploy();
        await PayMethod.deployed();
        await PayMethod.makeContributor( { value: ethers.utils.parseEther("11") });
        console.log(await PayMethod.sayHello()) ;
    }
    );
});