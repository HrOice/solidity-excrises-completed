// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Keccak {
    /**
     * In this exercise, the task is to return the correct keccak256 of any value passed into the keccak function
     */

    function keccak(uint256 x) external pure returns (bytes32) {
        // emit Logger(abi.encode(x));
        // your code here
        return keccak256(abi.encodePacked(x));
    }

    event Logger(bytes);
}
