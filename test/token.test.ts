// Start - Support direct Mocha run & debug
import hre from 'hardhat'
import '@nomiclabs/hardhat-ethers'
// End - Support direct Mocha run & debug

import chai, {expect} from 'chai'
import {solidity} from 'ethereum-waffle'
import {deployContract, getContract, signer} from './framework/contracts'
import {SignerWithAddress} from '@nomiclabs/hardhat-ethers/signers'
import {ethers} from 'ethers'
import {INAToken} from '../typechain-types'

chai.use(solidity)

const increaseTime = async (secondsToIncrease: number) => {
    await hre.ethers.provider.send('evm_increaseTime', [secondsToIncrease]);
    await hre.ethers.provider.send('evm_mine', []);
};

const latestBlockTime = async() => {
    const bn = await hre.ethers.provider.getBlockNumber();
    const block = await hre.ethers.provider.getBlock(bn);
    return block.timestamp;
}

const getBlockchainTimestamp = async(inDate: Date) => {    
    return Math.floor(inDate.getTime() / 1000);
}

describe('INAToken Distribution: ', () => {
    /// 'DeBay' smart contract
    let contract: INAToken
    /// signer object for bidders
    let signers: SignerWithAddress[]
    /// address string for bidders
    let signerAddrs: string[]
    /// get network
    let network: ethers.providers.Network
    /// deadline constant for 1 day
    const oneDaySeconds: number = 24 * 60 * 60
    /// deployed contract
    let addrContract = '0xc08BA1198fA68aA12BBa73C1c5b3FCB6243cbe6a'

    const totalSupply = 1000000000
    const priSaleAmount = 0.09 * totalSupply
    const priSalePrice = ethers.utils.parseEther("15000000");
    const pubSaleAmount = 0.15 * totalSupply
    const pubSalePrice = ethers.utils.parseEther("25000000");
    const IncentiveAmount = 0.10 * totalSupply
    const MarketingAmount = 0.17 * totalSupply
    const TeamAmount = 0.10 * totalSupply
    const AdviserAmount = 0.02 * totalSupply
    const ReserveAmount = 0.16 * totalSupply
    const LPRewardAmount = 0.10 * totalSupply
    const DevAmount = 0.11 * totalSupply

    before(async () => {
        signers = new Array(2)
        signerAddrs = new Array(2)
        for (let i = 0; i < signers.length; i++) {
            signers[i] = await signer(i)
            signerAddrs[i] = signers[i].address
        }
        network = await hre.ethers.provider.getNetwork();
    })

    describe('1. Normal Saling Process: ', () => {
        /// generate the random init floor amount (1 ~ 10 ether)
        const floorAmount = ethers.utils.parseEther(
            `${Math.floor(1 + Math.random() * 9)}`
        )

        before(async () => {
            /// deploy 'INAToken' contract for testing
            if (network.name =='maticmum' && addrContract.length > 0)
                contract = await getContract<INAToken>('INAToken', addrContract)
            else
                contract = await deployContract<INAToken>('INAToken')
        })

        it('1) Start new private sale: ', async () => {
            const startTime = await getBlockchainTimestamp(new Date(new Date().getTime() + 10 * 1000));
            await expect(contract.createSaleSchedule(
                signerAddrs[0],
                startTime,
                oneDaySeconds,
                priSaleAmount,
                priSalePrice,
                []
            )).to.be.emit(contract, "CreatedSale");
            const ssIds = await contract.getSalingScheduleIds();
        })

        it('2) Start new public sale: ', async () => {
            const startTime = await getBlockchainTimestamp(new Date(new Date().getTime() + 10 * 1000));
            await expect(contract.createSaleSchedule(
                signerAddrs[0],
                startTime,
                oneDaySeconds,
                pubSaleAmount,
                pubSalePrice,
                []
            )).to.be.emit(contract, "CreatedSale");

            const ssIds = await contract.getSalingScheduleIds();
        })
        
    })
})
