// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract LW3Buidlers is ERC20 {

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, 10 * 10 ** 18);
        owner = msg.sender;
    }

    function mintTokens(address beneficiary, uint amount) public onlyOwner {
        _mint(beneficiary, amount * 10 ** 18);
    }
}