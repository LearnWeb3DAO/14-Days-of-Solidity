// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Faucet {
    // supply some amount of ether to our faucet

    constructor() payable {
        // empty
    }

    // give some ether to anyone when they request

    function getEther() public {
        (bool sent,) = msg.sender.call{value: 100000000000000000}("");
        require(sent);
    }

    // helper function

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // we need a way to refill our faucet

    receive() external payable {}

    fallback() external payable {}
}