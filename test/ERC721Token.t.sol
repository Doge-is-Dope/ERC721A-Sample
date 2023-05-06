// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ERC721Token.sol";

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
    function _batchMint(uint256 _amount) private {
        for (uint256 i = 0; i < _amount;) {
            unchecked {
                dango.safeMint(user1, i++);
            }
        }
        assertEq(dango.balanceOf(user1), _amount);
    }

    /// @dev Test mint
    function testMint() public {
        _batchMint(10);
        assertEq(dango.balanceOf(user1), 10);

        vm.expectRevert("ERC721: token already minted"); // Check token minted
        dango.safeMint(user1, 0);
    }

    /// @dev Test transfer
    function testTransfer() public {
        _batchMint(10);

        vm.prank(user1);
        dango.safeTransferFrom(user1, user2, DEFAULT_TOKEN_ID);

        assertEq(dango.balanceOf(user1), 9); // Shall be 10 - 1
        assertEq(dango.balanceOf(user2), 1); // Shall be 1
    }

    /// @dev Test approve
    function testApprove() public {
        _batchMint(10);
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
