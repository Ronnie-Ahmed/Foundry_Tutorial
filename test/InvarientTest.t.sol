// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {WETH} from "../src/WETH.sol";

contract InvarientTest is Test {
    WETH private weth;

    function setUp() external {
        weth = new WETH();
    }

    function invariant_totalSupply_is_always_zero() external {
        assertEq(weth.totalSupply(), 0);
    }
}
