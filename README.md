# ERC20 Recurring

# Summary

A new token standard for recurring approvals

# Abstract

The following standard allows for the implementation of a standard API for tokens within smart contracts. This standard provides basic functionality to transfer tokens, as well as allows tokens to be periodically approved so they can be spent by another on-chain third party. It is compatible with ERC20.

# Motivation

A standard interface allows any tokens on Ethereum to be re-used by other applications: from wallets to decentralized exchanges. It also provides a way for dApps to get recurring approvals for their token.

# Specification

## Functions
This function is responsible for setting specific amount as the allowance of spender over the caller’s tokens for a particular time period and within a time limit. 
For example -> Allowing spender 100 tokens per month for a time limit of 6 months.\
Returns a boolean value indicating whether the operation succeeded.\
Emits ```RecurringApproval``` event.
```solidity
function recurringApprove(
        address spender,
        uint256 amount,
        uint256 timePeriod,
        uint256 timeLimit
    )
```
This function is responsible for moving ```amount``` tokens from ```from``` to ```to``` using the allowance mechanism. Only ```amount``` specified in ```recurringApprove``` can be transfered by spender within specific time period and time limit.\
For example -> Spender can transfer 100 tokens each month for a time limit of 6 months.
Returns a boolean value indicating whether the operation succeeded.
```solidity
function transferFromRecurring(
        address from,
        address to,
        uint256 amount
    )
```
## Events
```solidity
event RecurringApproval(
        address indexed owner,
        address indexed spender,
        uint256 amount,
        uint256 timePeriod,
        uint256 timeLimit
    );
```

# Important Links

- [Github](https://github.com/shivam2320/erc20r/blob/main/src/ERC20R.sol)
- [Example](https://www.notion.so/ERC20-Recurring-5c7cacb8293f4d618d0ee84d4f459a02)
- Demo
