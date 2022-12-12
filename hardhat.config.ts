import {task} from 'hardhat/config'
import '@typechain/hardhat'
import '@nomiclabs/hardhat-ethers'
import '@openzeppelin/hardhat-upgrades'
import '@nomiclabs/hardhat-waffle'
import {log} from './config/logging'
import "hardhat-gas-reporter";
import "hardhat-abi-exporter";
import "hardhat-contract-sizer";
import * as dotenv from "dotenv";

dotenv.config();

/*
 * This is a sample Hardhat task. To learn how to create your own go to https://hardhat.org/guides/create-task.html
 */
task('accounts', 'Prints the list of accounts', async (args, hre) => {
    const accounts = await hre.ethers.getSigners()

    log.info('List of available Accounts')
    for (const account of accounts) {
        log.info('%s', account.address)
    }
})

// task action function receives the Hardhat Runtime Environment as second argument
task('blockNumber', 'Prints the current block number', async (_, {ethers}) => {
    await ethers.provider.getBlockNumber().then((blockNumber) => {
        log.info('Current block number: %d', blockNumber)
    })
})

/*
 * You need to export an object to set up your config
 * Go to https://hardhat.org/config/ to learn more
 *
 * At time of authoring 0.8.4 was the latest version supported by Hardhat
 */
export default {
    networks: {
        hardhat: {
            chainId: 33133,
            allowUnlimitedContractSize: true,
            loggingEnabled: false
        },
        local: {
            url: 'http://localhost:8545',
            chainId: 33133,
            allowUnlimitedContractSize: true,
            loggingEnabled: true
        },
        mumbai: {
            url: process.env.POLYGON_MUMBAI_URL || "",
            accounts:
              process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY, process.env.PRIVATE_KEY1] : [],
            loggingEnabled: true
        },
        polygonmain: {
            url: process.env.POLYGON_MAINNET_URL || "",
            accounts:
              process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY, process.env.PRIVATE_KEY1] : [],
        }
    }, 
    solidity: {
        compilers: [
            {
                version: '0.8.4',
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 200
                    }
                }
            }
        ]
    },
    gasReporter: {
        enabled: process.env.REPORT_GAS !== undefined,
        currency: "USD",
        token: "ETH",
        coinmarketcap: process.env.COINMARKETCAP_API_KEY, 
        gasPriceApi: "https://api.etherscan.io/api?module=proxy&action=eth_gasPrice"
    },
    
    contractSizer: {
        alphaSort: true,
        disambiguatePaths: false,
        runOnCompile: true,
        strict: false,
    },

    etherscan: {
        // apiKey: process.env.ETHERSCAN_API_KEY,
        apiKey: process.env.POLYGONSCAN_API_KEY,
    },
}
