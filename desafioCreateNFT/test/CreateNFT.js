const {ethers} = require("hardhat");
const assert = require("assert");
const {expect} = require("chai");
const { exitCode } = require("process");
describe("CreateNFT", function () {
  it('has initial message', async  () => {
    const [deployer] = await ethers.getSigners();
    const CreateNFTFactory = await ethers.getContractFactory("CreateNFT");
    const CreateNFT = await CreateNFTFactory.deploy();
    await CreateNFT.deployed();
    const cantidadDeNFTs = 10;
    for( let i = 0; i < cantidadDeNFTs; i++){
      await CreateNFT.safeMint(deployer.address, i+1);
    }
    
    // Chequeos
    expect (await CreateNFT.owner()).to.equal(deployer.address); //Ser el dueño del contrato
    expect (await CreateNFT.symbol()).to.equal("RF"); //Que el simbolo sea RF
    expect (await CreateNFT.ownerOf(1)).to.equal(deployer.address); //Que el dueño del token sea el deployer
    expect (await CreateNFT.balanceOf(deployer.address)).to.equal(cantidadDeNFTs); //Que el balance del deployer sea 1

    console.log("Contract deployed to:", await CreateNFT.owner());
    await CreateNFT.transferFrom(deployer.address, deployer.address, 1); //Que el deployer pueda transferir el token a si mismo
    await CreateNFT.transferFrom(deployer.address, "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", 1); //Que el deployer pueda transferir a otro

    //chequeos
    expect (await CreateNFT.ownerOf(1)).to.equal("0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db"); //Que el  nuevo dueño del token realmente lo tenga
    expect (await CreateNFT.balanceOf(deployer.address)).to.equal(cantidadDeNFTs-1); //Que el balance del deployer sea 0
  });
});