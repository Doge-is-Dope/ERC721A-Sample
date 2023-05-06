# Gas Cost Comparison between ERC721 and ERC721A

This repository contains code for comparing the gas cost between `ERC721` and `ERC721A`, the most popular token standard and it's extension on the Ethereum blockchain. The goal of this project is to provide developers with insights into the gas costs of these two and to help them make more informed decisions about which one to use in their projects.

## Getting Started

```shell
forge test --gas-report
```

## Gas Cost Comparison Results

## Conclusion

Based on the results of our gas cost comparison, we found that ERC721A is generally more gas-efficient than ERC721 for batch-minting operations. However, for minting tokens one by one, the gas cost is similar for both standards. It's important to consider the specific use case and implementation when deciding which token standard to use.

## License

This project is licensed under the [MIT License](LICENSE).
