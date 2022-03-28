// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address owner;
    uint startTime;
    uint endTime;

    address[] allAddresses;

    constructor() {
        owner = msg.sender;
    }

    function startLottery(uint lotteryPeriod) public {
        require(msg.sender == owner, "You do not have the permission to call this function.");
        startTime = block.timestamp;
        endTime = startTime + lotteryPeriod;
    }

    function buyTicket() public payable {
        require(block.timestamp < endTime, "The lottery has already ended.");
        require(msg.value == 1 ether, "The amount supplied is wrong.");
        allAddresses.push(msg.sender);
    }

    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function endLottery() public payable returns (bool) {
        require(msg.sender == owner, "You are not the owner of the smart contract");
        require(block.timestamp > endTime, "The lottery is still going on...");

        // allAddress: [0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC40x, 5B38Da6a701c568545dCfcB03FcB875f56beddC4];

         uint indexOfWinner = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender))) % allAddresses.length;

         // Chainlink VRF --> Oracle

         // 5 address array
         // 123487878373 % 5 = 3

         address winner = allAddresses[indexOfWinner];

         (bool sent,) = winner.call{value: address(this).balance}("");

         return sent;
    }
}
