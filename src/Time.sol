// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.21;

contract Time {
    uint256 public startAt = block.timestamp + 1 days;
    uint256 public endAt = block.timestamp + 2 days;
    uint256 value = 0;

    function bid() external {
        require(
            block.timestamp >= startAt && block.timestamp <= endAt,
            "Can not Bid"
        );
        value += 1;
    }

    function end() external {
        require(block.timestamp >= endAt, "Can not End");
        value += 1;
    }

    function viewValue() public view returns (uint256) {
        return value;
    }
}
