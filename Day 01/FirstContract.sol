// SPDX-License-Identifier: MIT

// "MIT" license specifies that anyone can use this code for personal or commercial purposes.

pragma solidity ^0.8.0;

// Setting the compiler version for solidity --> will use the latest compiler version which is greater than 0.8.0.

// "contract" keyword is used to define a new smart contract.
// "FirstContract" is the name of smart contract.

contract FirstContract {
    string public GM = "GoodMorning";
    // Defining a new "string" data type called `GM` whose value is "GoodMorning".
    // The "public" keyword specifies that we can access this variable from outside the smart contract.
    // That means we can get its value from the smart contract any time.
}
