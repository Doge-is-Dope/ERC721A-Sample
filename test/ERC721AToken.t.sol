// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/ERC721AToken.sol";

contract DangoTest is Test {
    Dango dango;
    address user1;
    address user2;
    uint256 constant DEFAULT_TOKEN_ID = 0; // token id used for testing

    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    function setUp() public {
        dango = new Dango();
        user1 = address(0x1);
        user2 = address(0x2);
    }

    /// @dev mint multiple tokens in one transaction
    function _batchMint(address _receiver, uint256 _quantity) private {
        dango.batchMint(_receiver, _quantity);
        assertEq(dango.balanceOf(_receiver), _quantity);
    }

    /// @dev Test mint
    function testMint() public {
        _batchMint(user1, 10);
        assertEq(dango.balanceOf(user1), 10);
    }

    /// @dev Test transfer
    function testTransfer() public {
        _batchMint(user1, 10);

        vm.prank(user1);
        dango.safeTransferFrom(user1, user2, DEFAULT_TOKEN_ID);

        assertEq(dango.balanceOf(user1), 9); // Shall be 10 - 1
        assertEq(dango.balanceOf(user2), 1); // Shall be 1
    }

    /// @dev Test approve
    function testApprove() public {
        _batchMint(user1, 10);
        assertEq(dango.balanceOf(user1), 10);
        assertEq(dango.balanceOf(user2), 0);

        vm.prank(user1);
        dango.approve(user2, DEFAULT_TOKEN_ID);
        vm.prank(user2);
        dango.safeTransferFrom(user1, user2, DEFAULT_TOKEN_ID);

        assertEq(dango.balanceOf(user1), 9); // Shall be 10 - 1
        assertEq(dango.balanceOf(user2), 1); // Shall be 1
    }
}
