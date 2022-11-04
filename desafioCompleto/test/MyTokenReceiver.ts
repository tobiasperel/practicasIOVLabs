import { expect } from 'chai'
import { ethers } from 'hardhat'

async function deploy() {
  const myTokenFactory = await ethers.getContractFactory('MyToken')
  const myToken = await myTokenFactory.deploy()
  await myToken.deployed()
  return myToken
}

describe('MyTokenReceiver', () => {
  it('marks contributors', async () => {
    const [alice] = await ethers.getSigners()
    const myToken = await deploy()

    const myTokenReceiverFactory = await ethers.getContractFactory('MyTokenReceiver')
    const myTokenReceiver = await myTokenReceiverFactory.deploy(myToken.address)
    await myTokenReceiver.deployed()

    await myToken.connect(alice).approve(myTokenReceiver.address, 10).then(tx => tx.wait())
    await myTokenReceiver.contribute().then(tx => tx.wait())

    expect(await myToken.balanceOf(alice.address)).eq(90)
    expect(await myToken.balanceOf(myTokenReceiver.address)).eq(10)
    expect(await myTokenReceiver.isContributor(alice.address)).eq(true)
  })
})