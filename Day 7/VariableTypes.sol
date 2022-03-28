// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//local, state, global variables
//events(indexed) and structs, enums
//global variables: time units, block.timestamp, ether and wei and gwei, msg.sender, msg.value, block.number, abi.enocde, abi.decode, keccak256

contract VariableTypes {
   uint public number = 999;
   string public greeting = "Hello";
   uint public time = block.timestamp + 1 days; 
   uint public oneEther = 1 ether;
   uint public oneWei = 1 wei;
   uint public oneGwei = 1 gwei;
   uint public currentBlockNumber = block.number;
   //seconds
   //minutes
   //hours
   //days
   //weeks

   struct Person {
     string name;
     uint age;
     uint ageOfBirth;
   }

   enum Step{
       stepOne,
       stepTwo,
       stepThree
   }

 Step steps;

   Person[] public people;
   mapping(address => Person) public peopleMapping;
   
   event Transfer(address indexed from, address indexed to, uint amount);


   mapping(address => uint) public balance;

   function getBlockNumber() public view returns(uint) {
       return currentBlockNumber;
   }

   function setToStepTwo() public {
       steps = Step.stepTwo;
   }

   function pushPerson(string memory _name, uint _age, uint _ageOfBirth) public {
       people.push(Person(_name, _age, _ageOfBirth));
   }

   function pushPersonToMapping(string memory _name, uint _age, uint _ageOfBirth) public {
       peopleMapping[msg.sender].name = _name;
       peopleMapping[msg.sender].age = _age;
       peopleMapping[msg.sender].ageOfBirth = _ageOfBirth;
   }

   function receiveName() public view returns(string memory name) {
       return peopleMapping[msg.sender].name;
   }

   function encode() internal view returns(bytes memory) {
       return abi.encode(number, greeting);
   }

   function transfer(address payable _to) public payable {
       (bool success, ) = _to.call{value: msg.value}("");
       require(success, "Failed to send ether");
       emit Transfer(msg.sender, _to, msg.value);
   }

   function getHash() public view returns(bytes32) {
       return keccak256(encode());
   }

   function deCode() public view returns(uint number, string memory greeting) {
       bytes memory data = encode();
      (number, greeting) = abi.decode(data, (uint256, string));
   }

   function getMsgSender() public view returns(address) {
       return msg.sender;
   }

   function deposit() public payable {
       balance[msg.sender] += msg.value;
   }

   function getBalance() public view returns(uint) {
       return balance[msg.sender];
   }

   function confirmEthValue() public view returns(bool) {
       return oneEther == 1e18;
   }

    function confirmGweiValue() public view returns(bool) {
       return oneGwei == 1e9;
   }

   function getNumber() public view returns(uint) {
       return number; //23523 gas 
   }
   
   function getAnotherNumber() public pure returns(uint) {
       uint anotherNumber = 100;
       return anotherNumber; //	21392 gas
   }

   
}