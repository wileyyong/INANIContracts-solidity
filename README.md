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

<img width="1091" alt="Screenshot 2022-11-05 at 3 43 35 PM" src="https://user-images.githubusercontent.com/99618142/200118274-7f55bbdb-efce-44f9-b79f-8176fb76e538.png">


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


# 2. NFT Contract and Digitalization

In this Task we will have many creators. Let’s say vishal is a video creator. He has created many videos and among those videos some converted into nft. vishal also has some media coverage and news publications. And he has like 4M followers. 
Based on these many factors we are going to set a price of his stocks. Let’s assume price is 5INA token per stock. Now his followers or other our users can buy this stocks by paying 5INA token to vishal. Let’s say parsa buy 20 vishal’s stocks by paying 100 INA. Parsa can sell 100 stocks or fractions of it in the marketplace. 
Here eack creator will have his own stocks. Stock price will vary from creator to creator.  Creator is the company and they will have their own shares that you can buy.

## Further Details
suppose there is a dashboard like opensea collection nft dashboard page, in that dashboard there is information like number of followers, number of nfts, likes and other information related to that person, any of The parameters include a score, and based on this score, a price is determined for that person's credit, which can be considered equivalent to a number of INA tokens, now suppose that this person's credit can be bought and sold like the shares of a company.
Exactly, you can consider a simple formula for that, the sum of these points is equivalent to a certain number of tokens
Different users can buy and sell a part of a creator's credit with the INA token (like company shares) within this platform.
It should also be a smart contract where the manufacturer can mint his own NFT, maybe there is no need to buy and sell it.

Suppose that there are several parts on each user's page that are automatically completed by the platform and are visible like Instagram: 1. Followers 2. Followings 3. Number of nft. Total price of NFTs minted by this person. Number of investors. The number of views, comments, shares and etc … 
Finally, a default score can be considered for each of these factors, and the higher or lower their number, the higher or lower it will affect the price of this person's credit shares. The purpose of this task is for people to buy this person's credit shares.

question: Suppose I'm a creator and based on Calculations I got 1000000 stocks
So one token will be 1 ina token right ? Or is it 0.5 token

answer: Here we can decide, it is our hand, for example, every 1000 points average will be 2 tokens, so a person who has 1000000 points will get 2000 INA token and based on this number of tokens and the price of the INA token in the market, the total price of his credit shares is determined, now other users can buy and sell his credit.

All smart contracts must be developed from the user side (for mint nft as a video) and also for other users to buy credit, each user has a profile for himself that can sell a part of his credit shares.

similar projects: https://docs.mirror.finance

https://www.morpher.com/docs/morpher_whitepaper.pdf
https://github.com/Morpher-io/MorpherProtocol/tree/feature/DEV-38-accountmigration

