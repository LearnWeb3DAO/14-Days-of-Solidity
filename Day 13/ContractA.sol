// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint public number3;
    constructor(uint _number, string memory greeting, address addr) {
      number3 = _number;
    }
    function foo() public virtual pure returns(string memory) {
        return "Hello there";
    }
}

contract B is A {
    uint public number2;
    constructor() A(number2, "Hello", msg.sender) {
       
    }
    function foo() public virtual override pure returns(string memory) {
        return "Hello there2";
    }

    function otherFoo() public virtual pure returns(string memory) {
        return super.foo();
    }
}


contract C is A, B {
    function foo() public virtual override(A,B) pure returns(string memory) {
        return "Hello there3";
    }

    function otherFoo2() public virtual pure returns(string memory) {
        return super.foo();
    }
}

contract D is A, B, C{
    function foo() public virtual override(A,B,C) pure returns(string memory) {
        return "Hello there4";
    }
}