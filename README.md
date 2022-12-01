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

In this Task we will have many creators. Let’s say BOB is a video creator. He has created many videos and among those videos some converted into nft. BOB also has some media coverage and news publications. And he has like 4M followers. 
Based on these many factors we are going to set a price of his stocks. Let’s assume price is 5 INA token per stock(shares). Now his followers or other our users can buy this stocks by paying 5 INA token to BOB. Let’s say Parsa buy 20 BOB’s stocks by paying 100 INA. Parsa can sell 100 stocks or fractions of it in the marketplace. 
Here each creator will have his own stocks. Stock price will vary from creator to creator. Creator is the company and they will have their own shares that you can buy.

## Further Details
Consider that we have a dapp that works as a social network. Each user receives points based on his performance in this platform and based on the points (scores / metric value) that he gets, he can receive a credit that can sell this credit in the market and other users can buy and sell (trade) his credit.
In this platform, users have also the role of creators. A user who enters the platform can produce video content, mint it and display it in NFT format on his feed page (these video NFTs are not capable of buying and selling (soulbound token)).

Each user's points will be determined based on certain parameters on the platform. parameters such as the number of followers, the number of followings, the number of likes, the number of comments, the number of video NFTs, the number of shares, the number of video views and etc...

You can consider the formula that an increase in the number of specified parameters is equal to a score (score / metric value) and vice versa.

+1 followers = +1 score/points

+1 following = +1 score/points

-1 followers = -1 score/points

.
.
.

Each user has zero points (points / metric value) when he enters the platform, and his points increase or decrease with each action. For example, if a person is added to the number of followers, a number will be added to the number of points. If his video NFTs  is liked, one point will be added and if he receives a comment, one point will be added to it and etc. Also, if someone unfollows him, one point will be deducted from him and...

These points are finally converted into a certain amount of INA tokens (which is different for each user) and these INA  tokens are deposited into a liquidity pool, and based on the price of the number of INA  tokens in the liquidity pool, the total amount of each person's credit shares (stock) is determined (100% share of user credit). It can be defined in this way that when the number of points reaches 100, 10 INA tokens are deposited from the token contract to the liquidity pool, and based on the price of USDT unit in the crypto market (its information is obtained by Oracle), the total price of each person's credit shares is determined.

Total number of points * USDT token price * number of INA tokens calculated based on points = total credit price of each user

Of course, to optimize this system, you can consider a better formula so that it is easier to calculate the credit share(stock) price.

In this process, the number of points and the number of tokens received are updated every moment.

There are two ways to calculate these points, on-chain and off-chain.
In off-chain mode, the points of each user are calculated by the backend, and finally, by emitting the transfer function from the token contract, a specified number of tokens are deposited into the account of a liquidity pool contract, and with the support of this liquidity pool, the price of 100% of the users' credit shares is determined. (like shares of a company)

The second way is that all these calculations are done on-chain and by smart contracts.

The goal is for users to be able to buy and sell a percentage of each other's credits in a market. Each user has a separate marketplace where other users can buy his credit.

1. First, create a smart contract so that each user can mint their videos in NFT format (the purpose of this is to know the owner of the video - it is not possible to buy and sell video NFT)
2. Design a system where each user can sell a part of his credit shares in his own market and other users can trade his credit shares. This work is both for the benefit of his audience and for the benefit of users who can share in the profit or loss of each influencer. (Hint: you can create a factory contract that creates a separate smart contract for all users and all parameters are completed by the backend or frontend, and then a certain number of tokens are automatically deposited into the liquidity pool and the price of 100% credit shares for each user is specified be)
3. Create a contract for a market for buying and selling credit shares of users, according to the defined mechanism, each user can sell his credit shares and also buy the credit shares of other users.
4. Deploy all the contracts on the Polygon test (Mumbai) and write a unit test for the performance of the second part of the technical assessment.

You can change the formula for calculating credit shares for each user. The goal is to identify the creativity and dynamism of your mind in the development process.


