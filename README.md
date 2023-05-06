This repository contains code for comparing the gas cost between `ERC721` and `ERC721A`, the most popular token standard and it's extension on the Ethereum blockchain. The goal of this project is to provide developers with insights into the gas costs of these two and to help them make more informed decisions about which one to use in their projects.

## Getting Started
Install [Foundry](https://github.com/foundry-rs/foundry) and test with the following command.

```shell
forge test --gas-report
```

## Gas Cost Comparison Results
<img width="696" alt="Screenshot 2023-05-06 at 6 16 18 PM" src="https://user-images.githubusercontent.com/7845979/236618891-c1f640b4-68cb-4d4a-ac9b-1489c0bce200.png">

## Conclusion

Based on the results of our gas cost comparison, we found that ERC721A is generally more gas-efficient than ERC721 for batch-minting operations. However, for minting tokens one by one, the gas cost is similar for both standards. It's important to consider the specific use case and implementation when deciding which token standard to use.
