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

## 1. Token

First, create INA token according to the following features and deploy it on Polygon's testnet network.

# tokenomics

name of the token: INANI token
Symbol of the token: INA 
TotalSupply: 1,000,000,000


to Whom                   percentage         number of tokens    year 1    year 2    years 3    years 4    years 5 
=====================================================================================================================
private sale                   9%               90000000           9%
=====================================================================================================================
public sale                    25%              250000000


3 stage (5 years) => Year 1 - 5%
                     Year 2 - 5%
                     Year 3 - 5%
                     Year 4 _ 5%
                     Year 5 _ 5%
                     Totally 25%

Stage 1
Year 1 to 2 at first 5% of total amount of public sale will be released 

Stage 2
Year 2 to 4 — 10% of total amount of public sale will be released 

Stage 3
Year 4-5 —- 10% of total amount of public sale will be released

======================================================================================================================
marketing/partnership         17%            170000000        
======================================================================================================================
founers and team              10%            100000000                               4%         3%          3%
======================================================================================================================
advisors/legal                3%             30000000
======================================================================================================================
Treasury                      25%            250000000
======================================================================================================================
future & development          11%            110000000
======================================================================================================================


1.According to Tokonomics, it should be able to have a private sale. Research what is the best private sale method and use it. (Private sale
The price of each token is equivalent to 10 dollars. Minimum cap and maximum cap should be considered for it. After that, the token sending step will start automatically and the tokens will be locked based on the information in Tokonomics)
2.Also, the token allocation specified in Tokenomics in the smart contract must be observed (tokens should be deposited in Tokenomics for wallet addresses of different parts)
3.Tokens sent to Wallet Funder/Team will be locked for one year and after one year it is possible to withdraw and transfer them.

at first please read this article for clarification of this process :
https://medium.com/hackernoon/token-vesting-process-why-is-this-a-great-idea-34933e9e8bc5

after that check this repo and see how does it work:
1- https://github.com/binodnp/vesting-schedule
2- https://github.com/sirin-labs/crowdsale-smart-contract/tree/master/contracts
3- https://github.com/TeraBlock/TBC-vesting-contracts


You can use the codes of similar projects to show the best performance.


## 2. NFT Contract and Digitalization

In this Task we will have many creators. Let’s say vishal is a video creator. He has created many videos and among those videos some converted into nft. vishal also has some media coverage and news publications. And he has like 4M followers. 
Based on these many factors we are going to set a price of his stocks. Let’s assume price is 5INA token per stock. Now his followers or other our users can buy this stocks by paying 5INA token to vishal. Let’s say parsa buy 20 vishal’s stocks by paying 100 INA. Parsa can sell 100 stocks or fractions of it in the marketplace. 
Here eack creator will have his own stocks. Stock price will vary from creator to creator.  Creator is the company and they will have their own shares that you can buy.

similar projects: https://docs.mirror.finance

https://www.morpher.com/docs/morpher_whitepaper.pdf
https://github.com/Morpher-io/MorpherProtocol/tree/feature/DEV-38-accountmigration

