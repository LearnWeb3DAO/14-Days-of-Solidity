// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
//default values, constant, immutable, modifers, ternary operators, if, else, while, break, continue, for loops

contract Conditionals {
  uint constant public number = 10;
  int public number2;
  uint public forLoopNumber;
  address public immutable owner;
  bytes public someByte;
  address payable[] public investors;
  //0x00000000 = address(0)

  constructor() {
    owner = msg.sender;
  }
  
  modifier onlyOwner() {
    require(msg.sender == owner, "You are not the owner");
    _;
  }

  modifier CantBeZero() {
    require(msg.value > 0, "You are not sending anything");
    _;
  }

  function payContract() public payable CantBeZero {
    
  }

  function pushInvestors() public {
    investors.push(payable(msg.sender));
  }

  function payInvestors() public payable {
    for(uint i = 0; i < investors.length; i++) {
      investors[i].transfer(1 ether);
    }
  }

  function ternaryFunction() public view returns(string memory) {
    return number2 == 0 ? "This is zero" : "This is not zero";
  }


  function returnDifferentMessage() public view returns(bool) {
    if(number2 == 0) {
      return true;
    } else if(number2 > 0) {
      return false;
    }
  }

  function forLoopExample() public {
    for(uint i = 0; i < 10; i++) {
      forLoopNumber++;
    }
  }

  function whileExample() public pure returns(bool) {
    for(uint i = 0; i < 10; i++) {
     while(i > 0) {
       return true;
       break; //This line actually won't execute but break will help to stop a for loop
     }
    }
  }


  function returnContractBalance() public view returns(uint) {
    return address(this).balance;
  }



  function addressBoolean() public view returns(bool) {
    return owner == address(0);
  }

  function changeNumber(int _num) public onlyOwner {
     number2 = _num;
  }


  /* I commented this out because you cannot change the value of a variable if it is marked as constant*/
  // function changeConstantNumber(uint _constantNum) public {
  //   number = _constantNum;
  // }


}