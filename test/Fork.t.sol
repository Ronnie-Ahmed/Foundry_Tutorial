// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";

interface IWETH {
    function balanceOf(address) external view returns (uint256);

    function deposit() external payable;
}

contract ForkTest is Test {
    IWETH public iweth;

    function setUp() external {
        iweth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function testDeposit() external {
        uint256 balBefore = iweth.balanceOf(address(this));
        console2.log("Balance Before: ", balBefore);
        iweth.deposit{value: 100}();
        uint256 balAfter = iweth.balanceOf(address(this));
        console2.log("Balance After: ", balAfter);
        assertEq(balBefore + 100, balAfter);
    }
}
