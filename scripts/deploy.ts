import {run, ethers} from 'hardhat'
import {log} from '../config/logging'

async function main() {
    await run('compile')

    const accounts = await ethers.getSigners()

    console.log(
        'Accounts:',
        accounts.map((a) => a.address)
    )

    const network = await ethers.provider.getNetwork();
    console.log('Deploying contract on', network.name);
    const INAToken = await ethers.getContractFactory("INAToken");
    const inaToken = await INAToken.deploy(
        accounts[0].address,    // admin
        accounts[1].address,    // treasury
    );

    const WAIT_BLOCK_CONFIRMATIONS = 6;
    await inaToken.deployTransaction.wait(WAIT_BLOCK_CONFIRMATIONS);
    console.log(
        'Deployed:',
        inaToken.address
    )

    console.log('Verifying contract on Polygonscan...');
    await run(`verify:verify`, {
        address: inaToken.address,
        constructorArguments: [accounts[0].address, accounts[1].address],
    });
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        log.error(error)
        process.exit(1)
    })
