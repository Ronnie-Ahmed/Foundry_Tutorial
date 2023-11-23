// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;
import {Test, console2} from "forge-std/Test.sol";
import {Time} from "../src/Time.sol";

contract TestTime is Test {
    Time public time;
    uint256 start;

    function setUp() external {
        time = new Time();
        start = block.timestamp;
    }

    function testValue() external {
        uint256 val = time.viewValue();
        assertEq(val, 0);
    }

    function testBid() external {
        vm.warp(start + 1 days);
        time.bid();
        uint256 val = time.viewValue();
        assertEq(val, 1);
        vm.warp(start + 2 days);
        time.end();
    }

    function testfailEnd() external {
        vm.warp(start + 1 days);
        vm.expectRevert(bytes("Can not End"));
        time.end();
    }
}
