// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Remap is Ownable {
    constructor(address initialOwner) Ownable(initialOwner) {}
}
