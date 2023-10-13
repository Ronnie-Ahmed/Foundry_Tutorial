// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public EventContract;
    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() external {
        EventContract = new Event();
    }

    function testTransferEvent() external {
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(1), address(2), 123);
        EventContract.transfer(address(1), address(2), 123);
    }
}
