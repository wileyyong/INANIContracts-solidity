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

In this Task we will have many creators. Let’s say vishal is a video creator. He has created many videos and among those videos some converted into nft. vishal also has some media coverage and news publications. And he has like 4M followers. 
Based on these many factors we are going to set a price of his stocks. Let’s assume price is 5INA token per stock. Now his followers or other our users can buy this stocks by paying 5INA token to vishal. Let’s say parsa buy 20 vishal’s stocks by paying 100 INA. Parsa can sell 100 stocks or fractions of it in the marketplace. 
Here each creator will have his own stocks. Stock price will vary from creator to creator.  Creator is the company and they will have their own shares that you can buy.

## Further Details
Suppose we have a dapp and the goal is to determine credit shares for each user so that he can sell a part of his credit to his other contacts. There are several parts in each user's account, such as: 1. Followers 2. Following 3. Number of nft 4. Total price of NFT multiplied by this person 5. Number of investors 6. Like 7. Share 8. Comment 9. Number visit and...
For each of the above factors and parameters, we consider a score and the set of these scores will eventually become a specific number of tokens. For example, a user who has earned 1 million points will finally get 2000 tokens.
With this default, you should find a connection to determine the price of the users' credit shares. One solution is to multiply the total points by the number of tokens (based on the price of the token in the crypto market) and this way the total price of each person's credit shares is determined.
(total scores * number of INA token (token price in Ctypro market) = total credit shares)

Now, every user can sell a part of his credit shares in a marketplace and in this way sell his credit to his audience. The audience and fans of this creator can buy and sell a part of this person's credit with the inan token in the trading market and profit or lose from the rise and fall of this person's credit price.

Different users can buy and sell a part of a creator's credit with the INA token (like company shares) within this platform.
It should also be a smart contract where the manufacturer can mint his own NFT, maybe there is no need to buy and sell it. (NFT is only use for mint videos and does not have the ability to buy and sell, any user/creator can mint his videos in the form of NFT and the number of NFTs of creators is considered a point that increases his credibility.)


Let me explain more simply
You do not need to develop NFT fraction stocks at all
There will be develop only one separate contract for mint video, images, etc in NFT format
The principle of work is related to the development of people's credit shares
Suppose that we consider a hypothetical score for a number of parameters such as likes and comments, and the more followers, likes, and comments, the higher this score will be.
Now we convert these points
For example, 1 million points equals 2000 tokens
Now we want to determine the credit price of each person, this will be a formula
Total points (1 million) * number of tokens (2000)
The total price of one's credit depends on the price of the token in the market
Now each user can sell a part of his credit and other users can share in the profit from buying and selling it.


All smart contracts must be developed from the user side (for mint nft as a video) and also for other users to buy credit, each user has a profile for himself that can sell a part of his credit shares.


