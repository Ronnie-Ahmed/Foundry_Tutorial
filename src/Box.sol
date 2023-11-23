// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

contract BOXV1 {
    uint256 public number;

    function setNum(uint256 _number) external {
        number = _number;
    }
}

contract BOXV2 {
    uint256 public number;

    function incrementNum() external {
        number += 1;
    }
}
