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

# 1. Token (optional)

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


# 2. Creator coin
A social token is a token and virtual economy that revolves around a creator or community. An influencer can create their own social token that fans can then purchase, win, or earn.

the goal of this part of technical assesment is accelerate economic interactions between creators and fans, while ensuring that the value that emerges from those interactions accrues to the community participants in a way that is consistent with the creator’s preferences. 

in this part smart contracts allow Creators to define and manage their own economies.

##Creator Coins

Creator Coin is a creator’s fully customizable, branded cryptocurrency that represents their unique digital brand. I have designed this system to balance two seemingly contradictory beliefs:

1) Creator economies should be driven by unique currencies built around individual creators and their communities

2) A single currency across all creators would ensure the largest possible liquidity pool for the entire network and best establish a new coin as a usable currency

To balance these competing desires and prevent a liquidity crunch caused by fragmentation across unique Creator Coins, an essential part of the design is our use of Token Bonding Curves. Specifically, a smart contract for each Creator Coin acts as an Automated Market Maker providing a counterparty to anyone interested in buying or selling a Creator Coin. This AMM’s behavior is governed by a pricing curve that establishes a functional relationship between the supply of a Creator Coin and its current price.



![image](https://user-images.githubusercontent.com/99618142/206382739-7035f9d2-481c-44d9-a742-89de0b9e8c3c.png)


For example, when a fan wants to buy one of their favorite creator’s coins, their funds are transferred to the smart contract and a number of coins determined by our pricing curve are minted. And when the fan is ready to sell those coins, they are simply burned and funds are released from the smart contract according to the pricing curve. An important distinction between this Token Bonding Curve and an AMM like Uniswap is that this curve governs the entirety of the Creator Coin supply as opposed to creating a market for the subset of a token that individuals have chosen to include in the exchange pool.

this approach offers the substantial benefit that we can deploy unique Creator Coins for each of our creators while providing immediate and continuous liquidity at an algorithmically determined price that isn’t subject to thresholds of demand required by an exchange or order book matching. 

To understand how this works, let’s explore some transactions against a simple pricing curve. For the purposes of this example, we’ll assume some simple values that help illustrate some key concepts:

Our example Creator Coin has the symbol CC.
CC’s value is denominated in USD.
CC’s pricing curve is a straight line beginning at $0 with a slope that increases price by $2 for every 100 CC minted. That is:


![image](https://user-images.githubusercontent.com/99618142/206421493-2d61f191-f079-4ede-841f-d8ead91f32e1.png)


While it may be initially counterintuitive to think of price increasing with quantity from a consumer perspective, keep in mind that this supply curve represents the perspective of our AMM as a producer. The more someone is interested in paying for CC, the more our AMM acting in accordance with this curve will be willing to supply.

To get things started, let’s buy the first $100 of CC immediately after the coin is launched and its supply is zero. The contract walks up the pricing curve to determine the price of each new CC it mints until it has generated enough CC for the $100 purchase request. Or put another way, it advances to a point where the area under the curve is $100.

![image](https://user-images.githubusercontent.com/99618142/206421648-7f579334-bb03-4e44-9b8d-9f08b7b1bc48.png)

With the assumed pricing curve, this moves us to a supply of 100 CC. The purchaser receives 100 CC while $100 is added to the liquidity pool and the price of the last CC minted is now $2.

The same operation effectively happens in reverse whenever we sell CC. If, for instance, we chose to now sell 50 CC, we would walk back down the curve to the point where supply equals 50 CC. The contract would burn the 50 CC supplied by the seller and release the associated liquidity. Specifically, we would now be at a supply of 50 CC, the price of the last CC minted is now $1, the contract would release $75 to the seller, and the remaining liquidity pool would be $25.



![image](https://user-images.githubusercontent.com/99618142/206421757-0f477806-6393-4f0a-b035-180bec47b8ed.png)


It’s important to note here that a key piece of our pricing curves working well is that there is no fractionalization of the liquidity pool. At all times, the liquidity pool is fully funded in accordance with the pricing curve. All funds used to purchase Creator Coins and all proceeds from sales of Creator Coins come and go directly from the liquidity pool as trades are executed with the automated market maker.

While the simple linear pricing curve is helpful to illustrate functionality, it’s possible to begin designing for an economy with specific properties in mind by modifying the slope at various points along the curve. For I first cohort of creators, we’ve used our understanding of their existing economic interactions to inform a design captured in the following pricing curve.


![image](https://user-images.githubusercontent.com/99618142/206430912-072f1c37-bb35-434c-b399-b3537e99a853.png)



The initial segment of the curve labeled ‘A’ effectively represents a supply floor. Upon instantiation of a new Creator Coin, we mint the first 50,000 coins with a small amount of liquidity. These coins go to the corresponding creator and ensure that they have the ability to own a large percentage of the Creator Coin supply at all times, with the intention of motivating creators to behave in ways consistent with the long term value of their coin economy. While the continuous liquidity properties of the pricing curve hold for this segment, the price approaches zero very quickly and the associated liquidity pool is small.

As we progress into section ‘B’, we start to gradually increase slope. At this stage, the liquidity pool begins to build, and leveraging the automated market maker to buy and sell quantities of Creator Coins without quickly dropping below the effective supply floor is now possible. Additionally, the gradual build of the liquidity pool creates an opportunity for early adopters to acquire a meaningful share of their favorite creator’s coins for a relatively modest price.

Within segment ‘C’, we see our largest slope increases. We designed the curve with the intention of arriving in this segment when we start to see a similar amount of activity in the new tokenized economy that our first batch of creators were typically seeing on an annual basis in their existing economies. At this point, price and liquidity increase or decrease rapidly in response to demand and the relative volatility creates opportunities for interesting interactions around Creator Coins and the digital assets they support.

Lastly, in segment ‘D’ we arrive at a leveling off of price increases and hit our effective supply cap of 210,000 coins. The price limitations at the high end of the curve should help discourage unchecked speculation and limit the coin supply to levels consistent with expectations around appropriate economic interactions between our initial cohort of creators and their fans.

It is important to note here that alongside the design of the supply curve, a key determinant for price will always be the demand for a Creator Coin. While the pricing curve establishes a relationship between price and supply, it is the demand for the coin across its various use cases that will allow market forces to ultimately determine where on the curve we will be at any given time.


##Soulbound NFT


There will be a smart contract so that each user can mint their videos in NFT format (the purpose of this is to know the owner of the video - it is not possible to buy and sell video NFT - Note that these NFTs do not have the ability to buy and sell(Soulbound NFT))


==================================================================================================================================================



##Concepts:


Token Bonding Curves: A token bonding curve (TBC) is a pricing curve that establishes a functional relationship between the supply of a Coin and its current price. 


Genesis Coins: The first coins minted for a given coin. These coins go to the corresponding creator and ensure that they have the ability to own a large percentage of their Coin supply at all times, with the intention of motivating creators to behave in ways consistent with the long term value of their Coin economy.



Flow Controls: Flow controls govern the amount of coins that can be 1) converted (to $ّINA) and 2) transferred (to another user, transferring to a creator is excluded) after purchase. There are no flow controls on a fan sending a creator's coins to the creator.


==================================================================================================================================================


##Request items:


1.Develop a token factory smart contract that creates a unique token for each user by receiving the symbol token name and the user's wallet address.

2.Create a smart contract for the Creator Coins section that allows trading of each user's exclusive tokens with other users by Bonding Curve and AMM. (It is possible to use already developed smart contracts such as BancorBondingCurve) - Here there is a need for a liquidity pool and it is backed by INA tokens.
Each user will be able to buy and sell tokens of other users with INA tokens. In fact, the INA token will be the main pair of other tokens (user token / INA).

3.Develop a swap smart contract between users' tokens with INA so that it is only possible to withdraw money with swap tokens to INA token.

4.create a smart contract so that each user can mint their videos in NFT format (the purpose of this is to know the owner of the video - it is not possible to buy and sell video NFT)


Hint: This idea is derived from the https://rally.io/ platform.


