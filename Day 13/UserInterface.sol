// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IDataStorage {
   function receiveArray() external view returns(address[] memory addrs);
   function readNumber() external pure returns(uint);
   function readArray(uint[] memory numbers) external pure returns(uint[] memory);
}

contract UseInterface {
    address DataStorage;
    constructor(address _DataStorage) {
      DataStorage = _DataStorage;
    }


    function readThisNumber() public view returns(uint number) {
        (number) = IDataStorage(DataStorage).readNumber();
    }

    
}