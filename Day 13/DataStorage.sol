// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ContractA.sol";

contract DataStorage is A {
   // Storage, Memory, Calldata, Gas Usage, Inheritance/Importing, super keyword. Constructor in Inheritance, interfaces
    constructor() A(number, "Hello", msg.sender) {
       
    }

    uint public number;

    struct Person {
       string name;
       uint age;
       string height;
    }

    mapping(uint => Person) public currentPerson;

    address[] public addrs;

    function returnThisMessage() public pure returns(string memory) {
       return A.foo();
    }

    function pushAddresses() public {
       addrs.push(msg.sender);
    }

    function receiveArray() public view returns(address[] memory addrs) {
      return addrs;
    }

    function makePerson(uint index, string memory name, uint age, string memory height) public {
      Person storage person = currentPerson[index];
      person.name = name;
      person.height = height;
      person.age = age;
    }

    function readPerson(uint index) public view returns(string memory name, uint age, string memory height) {
      Person memory person = currentPerson[index];
      return (person.name, person.age, person.height);
    }

    
    function readNumber() public pure returns(uint) {
       uint number2 = 5;
       return number2;
    }

    function readArray(uint[] memory numbers) public pure returns(uint[] memory) {
      return numbers;
    }

    function readMessage(string calldata greeting) public pure returns(string calldata) {
      return greeting;
    }
}

