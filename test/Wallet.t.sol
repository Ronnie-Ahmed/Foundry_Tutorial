// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract WalletTest is Test {
    Wallet public wallet;

    function setUp() external {
        wallet = new Wallet();
    }

    function testOwner() external {
        address owner = wallet.owner();
        console2.log(owner);
        assertEq(owner, address(this));
    }

    function testwithDraw() external {
        vm.prank(address(1));
        vm.expectRevert(bytes("Only Owner can Withdraw"));
        wallet.withDraw();
    }

    function testSetOwner() external {
        vm.prank(address(1));
        vm.expectRevert(bytes("Only Owner can call this function"));
        wallet.setNewOwner(address(2));
    }

    function _sendEth(uint256 _amount) internal {
        (bool success, ) = address(wallet).call{value: _amount}("");
        require(success, "Transaction Failed");
    }

    function test_sendEth() external {
        uint256 bal = address(wallet).balance;
        deal(address(1), 123);
        vm.startPrank(address(1));
        _sendEth(123);
        assertEq(address(wallet).balance, bal + 123);
        vm.stopPrank();
    }
}
