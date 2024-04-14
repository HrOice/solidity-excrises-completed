// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract Typecast {
    /**
     * the goal of this exercise is to pass if msg.value is equal to the address of this contract or revert otherwise
     */

    function typeCast() external payable {
        // your code here
        emit Log(msg.value);
        emit Log(uint160(msg.value));
        emit Log(uint160(msg.value));
        emit Log(uint160(address(this)));
        // emit Log_address(address(msg.sender));
        // require(address(uint160(msg.value)) == address(this));
    }

    event Log(uint);

    event Log_address(address);

    // event Log_contract(contract);
}
