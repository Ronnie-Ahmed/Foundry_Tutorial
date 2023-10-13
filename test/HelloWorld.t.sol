// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";
import {HelloWorld} from "../src/HelloWorld.sol";

contract HelloWorldTest is Test {
    HelloWorld public helloWorld;

    function setUp() external {
        helloWorld = new HelloWorld();
    }

    function testString() external {
        string memory say = helloWorld.sayHello();
        console2.log(say);
        assertEq(say, "Hello World!");
    }
}
