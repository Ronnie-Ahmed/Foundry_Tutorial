// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {console2} from "forge-std/Console2.sol";

contract Wallet {
    address public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withDraw() external {
        require(msg.sender == owner, "Only Owner can Withdraw");
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Transaction Failed");
    }

    function setNewOwner(address _owner) external {
        require(msg.sender == owner, "Only Owner can call this function");
        owner = _owner;
    }
}
