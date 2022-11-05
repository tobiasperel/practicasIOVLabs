import { expect } from 'chai'
import { ethers } from 'hardhat'

describe('MyNFT', () => {
  it('mint an nft for a contributor', async () => {
    const [alice,bob] = await ethers.getSigners()

    const myTokenFactory = await ethers.getContractFactory('MyToken')
    const myToken = await myTokenFactory.deploy()
    await myToken.deployed()

    const myTokenReceiverFactory = await ethers.getContractFactory('MyTokenReceiver')
    const myTokenReceiver = await myTokenReceiverFactory.deploy(myToken.address)
    await myTokenReceiver.deployed()

    const myNFTFactory = await ethers.getContractFactory('MyNFT')
    const myNFT = await myNFTFactory.deploy(myTokenReceiver.address)
    await myNFT.deployed()

    await myToken.connect(alice).approve(myTokenReceiver.address, 10).then(tx => tx.wait())
    await myTokenReceiver.contribuir().then(tx => tx.wait())

    await myNFT.mint().then(tx => tx.wait())

    expect(await myNFT.ownerOf(0)).eq(alice.address)

    await myToken.connect(bob).mint().then(tx => tx.wait())
    expect(await myToken.balanceOf(bob.address)).eq(10)

    await myToken.connect(bob).approve(myTokenReceiver.address, 10).then(tx => tx.wait())
    expect(await myToken.allowance(bob.address, myTokenReceiver.address)).eq(10)
    await myTokenReceiver.connect(bob).contribuir().then(tx => tx.wait())

    await myNFT.connect(bob).mint().then(tx => tx.wait())
    expect(await myNFT.ownerOf(1)).eq(bob.address)
  })

  it('cannot mint if not contributor', async () => {
    const [alice] = await ethers.getSigners()

    const myTokenFactory = await ethers.getContractFactory('MyToken')
    const myToken = await myTokenFactory.deploy()
    await myToken.deployed()

    const myTokenReceiverFactory = await ethers.getContractFactory('MyTokenReceiver')
    const myTokenReceiver = await myTokenReceiverFactory.deploy(myToken.address)
    await myTokenReceiver.deployed()

    const myNFTFactory = await ethers.getContractFactory('MyNFT')
    const myNFT = await myNFTFactory.deploy(myTokenReceiver.address)
    await myNFT.deployed()

    await expect(myNFT.mint()).rejectedWith('Not contributor')
  })
})