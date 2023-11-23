// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import {Script, console2} from "forge-std/Script.sol";
import {Wallet} from "../src/Wallet.sol";
import {BOXV1, BOXV2} from "../src/Box.sol";

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        new Wallet();
        vm.stopBroadcast();
    }
}

contract BoxV1Deploy is Script {
    function setUp() public {}

    function run() public {
        // address proxy=Up
        vm.startBroadcast();
        BOXV1 box = new BOXV1();

        vm.stopBroadcast();
    }
}
