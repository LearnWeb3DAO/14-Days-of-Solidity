// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Auction {
    // state variables
    address payable public beneficiary;
    // payable keyword tells solidity that this account can be used to pay to some ether
    uint public auctionEndTime;

    address public owner;

    // current state of the smart contract
    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) public pendingReturns;

    bool ended = false;

    // events
    event HighestBidIncrease(address bidder, uint amount);
    event AuctionEnded(address winner, uint amount);

    // constructor
    constructor(uint _biddingTime, address payable _beneficiary) {
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime * 60;
        owner = msg.sender;
    }

    // bid function used to bid
    function bid() public payable {
        require(block.timestamp < auctionEndTime, "The auction has already ended");
        require(msg.value > highestBid, "There exists a higher bid already");

        pendingReturns[highestBidder] += highestBid;

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncrease(msg.sender, msg.value);
    }

    // withdraw function: people who got outbid can use this function to withdraw their ether
    function withdraw() public returns(bool) {
        uint amount = pendingReturns[msg.sender];

        if (amount > 0) {
            pendingReturns[msg.sender] = 0;

            (bool sent,) = msg.sender.call{value: amount}("");

            if (!sent) {
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    // auctionEnd function: transfers the highest bid to the beneficiary
    function auctionEnd() public returns (bool) {
        require(msg.sender == owner);
        require(block.timestamp > auctionEndTime, "The auction is not yet ended");
        require(!ended, "The function auctionEnd has already been called");

        ended = true;

        emit AuctionEnded(highestBidder, highestBid);

        (bool sent,) = beneficiary.call{value: highestBid}("");

        return sent;
    }
}
