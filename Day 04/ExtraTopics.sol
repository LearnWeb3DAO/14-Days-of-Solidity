// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// msg.sender global variable and delete keyword

/*

Default values for Data types in solidity: 

boolean: false

string: ""

uint: 0

address: 0x0000000000000000000000000000000000000000

*/

contract ExtraTopics {
    uint public number = 78;
    string public message = "Hello";
    bool public isPaused = true;
    address public myAddress = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    function getMsgSender() public view returns (address) {
        return msg.sender;
    }

    function reset() public {
        delete number;
        delete message;
        delete isPaused;
        delete myAddress;
    }
}