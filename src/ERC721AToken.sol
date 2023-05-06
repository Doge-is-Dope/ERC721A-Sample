// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "ERC721A/ERC721A.sol";

contract Dango is ERC721A {
    constructor() ERC721A("Dango", "DGO") {}

    function batchMint(address receiver, uint256 quantity) external payable {
        // `_mint`'s second argument now takes in a `quantity`, not a `tokenId`.
        _mint(receiver, quantity);
    }
}
