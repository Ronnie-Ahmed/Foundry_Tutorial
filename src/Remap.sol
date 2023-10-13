// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {console2} from "forge-std/Console2.sol";

contract Remap is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}
}
