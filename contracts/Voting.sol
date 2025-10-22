// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21 <0.9.0;

/**
 * 一个mapping来存储候选人的得票数
 * 一个vote函数，允许用户投票给某个候选人
 * 一个getVotes函数，返回某个候选人的得票数
 * 一个resetVotes函数，重置所有候选人的得票数
 */

contract Voting {

    mapping(address => uint) ticket;

    function vote(uint number) external {
        ticket[msg.sender] = number;
    }

    function getVotes() external view returns(uint) {
        return ticket[msg.sender];
    }

    function resetVotes() external {
        ticket[msg.sender] = 0;
    }
}