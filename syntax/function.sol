// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Demo {
       // public 
       // external
       // internal
       // private 
       
       //view 
       //pure 
       
       //call
       
    string message = "Yo!";
    
    //transaction
    function setMessage(string memory newMessage) external{
        message = newMessage;
    }
    
    uint public balance;

    function pay() public payable {
        balance += msg.value;
    }

    function getBalance() public view returns(uint) {
        uint balance = address(this).balance;
        return balance;
    }

    function getBalance2() public view returns(uint balance) {
        balance = address(this).balance;
    } 

    function getMessage() internal view returns(string memory) {
       return message; 
    }

    function rate(uint amount) internal pure returns(uint) {
       return amount * 3;
    }
}
