// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DataTypes{
    //Primitive Data Types
   //int  ++, --, +=, -=, ==, %, /
   //uint
   //boolean
   //address
   //bytes  
   //string
   //Mapping: Advanced Data Type
   //Arrays: Advanced Data Type


    string public hello = "Hello"; //Basic string variable
    uint public number; //Basic variable to define a unsigned integer
    int public number2; //Basic variable to define an integer
    int public minNumber2 = type(int).min; //The lowest number for an integer
    uint public minNumber = type(uint).min; //The lowest number for an unsigned integer
    uint public maxNumber = type(uint).max; //The highest number for an unsigned integer
    int public maxNumber2 = type(int).max; //The highest number for an integer
    bool public isPaused; //Basic variable to define a boolean
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //Example of defining an address variable
    bytes public value; //Basic variable to define a byte type
    mapping(address => uint) public balance; //A simple mapping that stores the amount based on someones address
    string[] public nameOfArrays; //A dynamic array only for strings


     
    //Function that pushes/adds string values into the nameOfArrays array
    function pushName(string memory _name) public {
      nameOfArrays.push(_name);
    }

   //Function that pops/deletes string values into the nameOfArrays array
    function popName() public {
        nameOfArrays.pop();
    }

    //Function that changes a primitive data type into bytes
    function encode() public view returns(bytes memory) {
        bytes memory encode = abi.encode("Hello");
        value = encode;
    }

    //Function that adds 1 to a number
    function increment() public {
        number++;
    }
   
    //Function that subtracts 1 to a number
    function decrement() public {
        number--;
    }

    //Function that changes the isPaused variable to true or false
    function changeBoolean(bool _trueOrFalse) public {
      isPaused = _trueOrFalse;
    }

    //Function that adds the uint amount to the address based on the parameters in the balance mapping
    function addToBalance(address _addr, uint _amount) public {
        balance[_addr] += _amount;
    }

    //Function that returns the uint amount based on the address typed into the parameters
    function readBalance(address _addr) public view returns(uint) {
        return balance[_addr];
    }

}