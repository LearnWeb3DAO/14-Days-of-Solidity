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
    
    string public hello = "Hello";
    uint public number;
    //2**256 - 1
    //-2**256 - 1
    int public minNumber2 = type(int).min;
    uint public minNumber = type(uint).min;
    bool public isPaused;
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes public value;
    mapping(address => uint) public balance;
    string[] public nameOfArrays;
     
    function pushName(string memory _name) public {
      nameOfArrays.push(_name);
    }

    function popName() public {
        nameOfArrays.pop();
    }


    function encode() public view returns(bytes memory) {
        bytes memory encode = abi.encode("Hello");
    }

    function increment() public {
        number++;
    }

    function decrement() public {
        number--;
    }

    function changeBoolean(bool _trueOrFalse) public {
      isPaused = _trueOrFalse;
    }

    function addToBalance(address _addr, uint _amount) public {
        balance[_addr] += _amount;
    }

    function readBalance(address _addr) public view returns(uint) {
        return balance[_addr];
    }

}