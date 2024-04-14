// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.13;

contract OneWeekLockup {
    /**
     * In this exercise you are expected to create functions that let users deposit ether
     * Users can also withdraw their ether (not more than their deposit) but should only be able to do a week after their last deposit
     * Consider edge cases by which users might utilize to deposit ether
     *
     * Required function
     * - depositEther()
     * - withdrawEther(uint256 )
     * - balanceOf(address )
     */
    mapping(address => uint256) balanceOfUser;
    mapping(address => uint256) depositTime;


    function balanceOf(address user) public view returns (uint256) {
        // return the user's balance in the contract
        return balanceOfUser[user];
    }

    function depositEther() external payable {
        /// add code here
        balanceOfUser[msg.sender] += msg.value;
        depositTime[msg.sender] = block.timestamp;
        emit Log(block.timestamp, block.timestamp);
    }

    function withdrawEther(uint256 amount) external {
        /// add code here
        uint256 tm = depositTime[msg.sender];
        emit Log(tm + 7 days, block.timestamp);
        require((tm + 7 days) <= block.timestamp, 'time');
        require(amount <= balanceOfUser[msg.sender], 'balance');
        payable(msg.sender).transfer(amount);
    }

    event Log(uint, uint);
}
