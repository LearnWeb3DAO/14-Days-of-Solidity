// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FunctionSignature {
    //public, internal, private, external visibility
    //view, pure, payable, override, virtual, return, multiple return values, parameters
    //constructor, .call method, brief introduction of inheritance

    uint public number = 5;
    string public greeting = "Hello";

   address public owner;

    constructor() {
      owner = msg.sender;
    }

    function _randomFunction() internal view returns(uint) {
       return number;
    }
    
    function randomFunction2() public view returns(uint) {
        return _randomFunction();
    }

    function HelloThere() public view virtual returns(string memory) {
        return "HelloThere";
    }
    
    function payPerson(address payable _addr) public payable {
    (bool success,) = _addr.call{value: 10 ether}("");
     require(success, "Failed to send ether");
    }

    function returnMultipleValues() public view returns(uint, string memory) {
        return (number, greeting);
    }

    function parameters(uint _number) public pure returns(uint)  {
        //string
        //address
        //uint and int
        //bytes
        uint randomNumber = _number;
        return randomNumber;
    }

    function payContract() public payable {
       
    }

    function readContractBalance() public view returns(uint) {
        return address(this).balance;
    }

    function externalFunction() external view returns(string memory) {
       return greeting;
    }

    //You cannot call an external function inside a function if it is in the contract that the external function was declared

    // function callFunction() public view returns(string memory) {
    //     string memory Hello = externalFunction();
    //     return Hello;
    // }



}

contract Inheritor is FunctionSignature {
    FunctionSignature functionSignature;

    function viewNumberFromContract() public view returns(uint) {
       uint number = FunctionSignature._randomFunction();
       return number;
    }

    function callExternalFunction() public view returns(string memory) {
        string memory Hello = functionSignature.externalFunction();
        return Hello;
    }

   function HelloThere() public view override returns(string memory) {
        return "HelloThere";
    }
}

