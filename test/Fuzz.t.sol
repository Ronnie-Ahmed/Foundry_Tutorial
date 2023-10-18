// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";

contract FuzzTest is Test {
    function setUp() external {}

    function multiply(uint256 x, uint256 y) internal returns (uint256) {
        return x * y;
    }

    function testMultiply(uint256 _x, uint256 _y) external {
        vm.assume(_x < 50);
        vm.assume(_y < 50);
        uint256 ans = multiply(_x, _y);
        uint256 answer = _x * _y;

        assertEq(ans, answer);
    }
}
