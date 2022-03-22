// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SimpleStorage {
    uint storedData = 5;

    function setStoredData(uint x) public {
        storedData = x;
    }

    function getStoredData() public view returns (uint) {
        return storedData;
    }
}