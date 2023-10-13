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
        vm.expectRevert();
        wallet.withDraw();
    }
}
