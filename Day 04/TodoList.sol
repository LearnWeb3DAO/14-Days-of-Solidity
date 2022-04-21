// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Todo {
    // mapping to store todos for individual addresses
    mapping(address => string[]) public todos;

    // addTodo function
    function addTodo(string memory _todo) public {
        // Adds the _todo the array of todos for this individual address (msg.sender)
        todos[msg.sender].push(_todo);
    }

    // getTodos function
    function getTodos() public view returns (string[] memory) {
        return todos[msg.sender];
    }

    // getTodosLength function
    function getTodosLength() public view returns (uint) {
        return todos[msg.sender].length;
    }

    // delTodo function
    function delTodo(uint _idx) public {
        require(_idx < todos[msg.sender].length, "The index doesn't exist");
        todos[msg.sender][_idx] = todos[msg.sender][getTodosLength() - 1];
        todos[msg.sender].pop();
    }
}