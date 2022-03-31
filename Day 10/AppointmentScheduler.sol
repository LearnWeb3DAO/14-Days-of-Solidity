// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AppointmentScheduler {
    // state variables
    uint rate;
    address payable public owner;

    struct Appointment {
        string title;
        address attendee;
        uint startTime;
        uint endTime;
        uint amountPaid;
    }

    Appointment[] appointments;

    // constructor
    constructor() {
        owner = payable(msg.sender);
    }

    // getRate function
    function getRate() public view returns (uint) {
        return rate;
    }

    // setRate function
    function setRate(uint _rate) public {
        require(msg.sender == owner, "Only the owner can call this function.");
        rate = _rate;
    }

    // getAppointments function
    function getAppointments() public view returns (Appointment[] memory) {
        return appointments;
    }

    // createAppointment function
    function createAppointment(
        string memory title,
        uint startTime,
        uint endTime
    ) public payable {
        uint amountToPay = (endTime - startTime / 60) * rate;
        Appointment memory appointment = Appointment(title, msg.sender, startTime, endTime, amountToPay);
        require(msg.value >= appointment.amountPaid, "You need to pay more ether");

        (bool success,) = owner.call{value: msg.value}("");

        require(success, "Failed to send Ether");

        appointments.push(appointment);
    }

    // Helper function

    function currentTime() public view returns (uint) {
        return block.timestamp;
    }
}