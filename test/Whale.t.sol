// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WhaleTest is Test {
    IERC20 public whale;

    function setUp() external {
        whale = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }

    function testDeposit() external {
        address testAddress = address(1234);
        uint256 balBefore = whale.balanceOf(testAddress);
        console2.log("Balance Before: ", balBefore);
        uint256 total = whale.totalSupply();
        console2.log("Total Supply before: ", total / 1e18);
        deal(address(whale), testAddress, 10e6 * 10e18, true);
        uint256 balAfter = whale.balanceOf(testAddress);
        console2.log("Balance After: ", balAfter / 1e18);
        total = whale.totalSupply();
        console2.log("Total Supply After: ", total / 1e18);
    }
}
