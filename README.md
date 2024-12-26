# Personal Savings Tracker 💰🎯

## Overview

Personal Savings Tracker is a blockchain-based application that helps users create, manage, and track their savings goals with a unique reward points system. Built on Ethereum, this decentralized application (dApp) allows users to set savings targets, deposit funds, and earn rewards for achieving their financial objectives.

## 🌟 Features

- **Create Savings Goals**: Set personalized savings targets with custom names, amounts, and deadlines
- **Goal Tracking**: Monitor progress for multiple savings goals
- **Reward Points System**: Earn points for completing savings goals
- **Transparent & Decentralized**: Powered by Ethereum smart contracts
- **Easy Withdrawal**: Withdraw funds once goals are completed

## 🛠 Technologies

- **Blockchain**: Ethereum
- **Smart Contract Language**: Solidity ^0.8.20
- **Frontend**: HTML, CSS, JavaScript
- **Web3 Library**: Web3.js
- **Wallet Integration**: MetaMask

## 📦 Prerequisites

- [MetaMask](https://metamask.io/) browser extension
- Ethereum wallet with testnet/mainnet ETH
- Web browser with Web3 support

## 🚀 Installation & Setup

### Smart Contract Deployment

1. Install [Hardhat](https://hardhat.org/) or [Truffle](https://www.trufflesuite.com/truffle)
2. Compile the smart contract
3. Deploy to Ethereum network (Testnet recommended)
4. Copy the deployed contract address

### Web Application Setup

1. Open the HTML file in a modern web browser
2. Replace `CONTRACT_ADDRESS` with your deployed contract address
3. Replace `CONTRACT_ABI` with the contract's full ABI

## 🔧 How to Use

1. **Connect Wallet**

   - Click "Connect Wallet"
   - Approve MetaMask connection

2. **Create a Savings Goal**

   - Enter goal name
   - Set target amount (in ETH)
   - Choose deadline in days

3. **Deposit Funds**

   - Select a goal
   - Click "Deposit"
   - Enter amount to deposit

4. **Track Progress**
   - View current savings
   - Monitor reward points
   - Check goal status

## 🏆 Reward Points System

- Base points for goal completion
- Bonus points for early achievement
- Points scale with goal difficulty

## 💡 Smart Contract Functions

- `createSavingsGoal()`: Create new savings target
- `depositToGoal()`: Add funds to a specific goal
- `withdrawCompletedGoalFunds()`: Retrieve completed goal funds
- `getUserRewardPoints()`: Check total reward points

## 🔒 Security Considerations

- Goal funds are locked until target achieved
- Time-based restrictions prevent premature withdrawals
- Reward points incentivize consistent saving

## 🧪 Testing

Recommended test scenarios:

- Create goals with various amounts
- Partial and full deposits
- Goal completion
- Reward points calculation

## 🔮 Future Roadmap

- Multi-token support
- Social sharing of achievements
- Advanced analytics
- Mobile application

## ⚠️ Disclaimer

- Use on Ethereum testnets first
- Verify all transactions
- Cryptocurrency investments carry risks

## 📄 License

MIT License

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 📧 Contact

[Your Name/Organization]

- Email:
- GitHub:
- Project Link:

---

**Happy Saving! 💸**
