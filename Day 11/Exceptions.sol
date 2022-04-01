// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


//Exceptions(Require, Assert, Revert), how are these different from conditionals, try/catch, gas usage with exceptions

contract WillThrow {
    function aFunction() external {
        require(msg.sender != address(0), "Error message");
        assert(msg.sender == address(0));
    }
}

contract Exceptions {
   mapping(address => uint) public balance;

   function deposit() public payable {
    //    if(msg.value > 0) {
    //        balance[msg.sender] += msg.value;
    //    }
       require(msg.value > 0, "You didn't send any ether");
       balance[msg.sender] += msg.value;
   }

   function depositWithRevert() public payable {
       if(msg.value > 0) {
           revert("You didn't sent any ether");
       } else {
           balance[msg.sender] += msg.value;
       }
   }

   function withdraw(address payable _to) public payable {
       require(balance[msg.sender] >= msg.value, "You don't have that much ether");
       assert(balance[msg.sender] > balance[msg.sender] - msg.value);
       balance[msg.sender] -= msg.value;
       (bool success, ) = _to.call{value: msg.value}("");
       require(success, "Failed to send ether");
   }

   function balanceOfContract() public view returns(uint) {
       return address(this).balance;
   }

    event ErrorLogging(string reason);
     event LogBytes(bytes data);
     event panic(uint reason);
    function catchError() public {
        WillThrow will;
        try will.aFunction() {
            //here we could do something if it works
        }  catch Error(string memory reason) {
            emit ErrorLogging(reason);
            //failing require and revert statements
        } catch (bytes memory reason) {
            emit LogBytes(reason);
            //failing assert statements
             //when everything else fails
        } catch Panic(uint reason) {
           emit panic(reason);
            //failing assert statements
        }
    }
  
       
}