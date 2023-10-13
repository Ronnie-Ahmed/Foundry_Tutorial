// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.20;
import {Test, console2} from "forge-std/Test.sol";

contract SignatureTest is Test {
    function testSignature() external {
        uint256 privateKey = 123;
        address publicKey = vm.addr(privateKey);
        bytes32 messageHash = keccak256("Secret Message");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);
        address signer = ecrecover(messageHash, v, r, s);
        assertEq(signer, publicKey);
    }
}
