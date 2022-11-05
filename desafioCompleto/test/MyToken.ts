import { expect } from 'chai'
import { ethers } from 'hardhat'


async function deploy() {
  const myTokenFactory = await ethers.getContractFactory('MyToken')
  const myToken = await myTokenFactory.deploy()
  await myToken.deployed()
  return myToken
}

describe('MyToken', () => {
  describe('mint', () => {
    it('mint success', async () => {
      const myToken = await deploy()

      const [alice, bob] = await ethers.getSigners()

      const tx = await myToken.connect(bob).mint()
      await tx.wait()

      expect(await myToken.balanceOf(bob.address)).equal(10)
    })

    it('mint fails because of time', async () => {
      const myToken = await deploy()

      const [alice, bob] = await ethers.getSigners()

      const tx = await myToken.connect(bob).mint()
      await tx.wait()
      await expect(myToken.connect(bob).mint()).rejectedWith('Too early')
    })

    it('mint success after time', async () => {
      const myToken = await deploy()

      const [alice, bob] = await ethers.getSigners()

      const tx = await myToken.connect(bob).mint()
      await tx.wait()

      for (let i = 0; i < 5; i++) {
        await ethers.provider.send('evm_mine', [])
      }

      const otherTx = await myToken.connect(bob).mint()
      await otherTx.wait()
      expect(await myToken.balanceOf(bob.address)).equal(20)
    })
  })

  describe('admin block period', () => {
    // initial time is 5 blocks
    // owner can change time
    it('not owner cannot change time', async () => {
      const myToken = await deploy()

      const [, mallory] = await ethers.getSigners()

      await expect(myToken.connect(mallory).changeBlockPeriod(1)).rejectedWith('Only owner')
    })
    // cannot mint after new set time
    it('Owner can change time', async () => {
      const myToken = await deploy()

      const [alice] = await ethers.getSigners()

      await myToken.connect(alice).changeBlockPeriod(1) ;
      expect(await myToken.blockPeriod()).equal(1)
    })
  })
})

