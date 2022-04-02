// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SalaryManagement {
    mapping(address => Employee) public employees;
    address[] public allEmployees;

    address owner;

    struct Employee {
        Position position;
        uint salary;
    }

    enum Position{Intern, Junior, Senior}

    constructor() payable {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    function addEmployee(address payable employeeAddress, Position employeePosition) public onlyOwner {
        uint pay;

        if (employeePosition == Position.Intern) {
            pay = 1 ether;
        } else if (employeePosition == Position.Junior) {
            pay = 2 ether;
        } else {
            pay = 3 ether;
        }

        Employee memory newEmployee = Employee(employeePosition, pay);
        employees[employeeAddress] = newEmployee;
        allEmployees.push(employeeAddress);
    }

    function payEmployees() public payable onlyOwner {
        for (uint i = 0; i < allEmployees.length; i++) {
            (bool sent,) = payable(allEmployees[i]).call{value: employees[allEmployees[i]].salary}("");
            require(sent);
        }
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // function acceptPayment() public payable {
    //     // function to receive payment
    // }

    receive() external payable {}

    fallback() external payable {}
}