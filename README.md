# Introduction
The purpose of this exercise is to check your skill level in developing and testing smart contracts and the dynamics of your mind to solve the problem

# Objective

This exercise aims to:
Test your engineering skills
Test your thinking process when you're creating something from scratch
Below you will find the instructions of this exercise.

# Before beginning

Keep in mind that:
You only have to be focused on the smart contract, not on the UI
You do not have to write code out of the /contracts folder, nevertheless you can if you think it's necessary
Keep in mind your code quality will be appreciated

# Environment

Engines versions
Node: 16.X.X (node -v)
npm: 8.X.X (npm -v)

Installation

npm install # or yarn

# Scripts

You will need to use npm scripts to run, test and build this application.

Environment

This exercise must be done in Solidity. The development environment to compile, deploy, test and run the code provided by hardhat is already configured.

Tools and libraries

The tools and libraries listed below are already set-up for you. However, feel free to modify the configuration or even the stack to fit your needs.

Ethers.js: a JavaScript library to interact with Ethereum
Waffle: a library for testing smart contracts.
Chai: a BDD/TDD assertion library
Solhint: a Solidity linter
Typescript: a strongly typed programming language that builds on JavaScript
Typechain: a TypeScript blinders for Ethereum smart contracts

# Instructions

# 1. Token

First, create INA token according to the following features and deploy it on Polygon's testnet network.

## tokenomics

name of the token: INANI token

Symbol of the token: INA 

TotalSupply: 1,000,000,000

<img width="984" alt="Screen Shot 2022-11-18 at 8 49 37 AM" src="https://user-images.githubusercontent.com/99618142/202619503-abd846cf-bf44-440b-8e04-90a09fc9a875.png">



1.According to Tokonomics, it should be able to have a private sale. Research what is the best private sale method and use it. (in Private sale stage The price of each token is equivalent to 0.16 dollars. Minimum cap and maximum cap should be considered for it. After that, the token sending step will start automatically)

2.The purpose of private sale is to fundraising from investors. It means that based on the considered token price (0.16 $), investors can buy their tokens with eth, usdt and matic. (must be defined in the smart contract)

3.The fundraised (with eth, usdt and matic) must be transferred to a specific wallet.

4.The goal of this private sale is to reach 15 million dollars (or equivalent Eth, usdt or matic) and once this amount is reached the private sale will be completed.

5.The maximum duration of a private sale is 6 months and the owner can stop it at any time.

6.Tokens intended for Funder/Team (based on Tokenomics) are sent to a specific wallet and are locked for one year, and after one year it is possible to withdraw and transfer them.

7.It should be possible for the owner to lock the tokens of a wallet (to prevent whales from controlling them).

8.After the completion of the private sale, the tokens will be ready to be listed in centralized and decentralized exchanges.


# 2. Creator credit




