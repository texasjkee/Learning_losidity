// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Library {
    function setMessage(string memory newMessage) external{
        message = newMessage;
    }
}
