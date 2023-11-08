// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Demo {
    //require
    //revert
    //assert
    address owner;

    constructor() {
        owner = msg.sender;    
    }
    
    function pay() external payable {

    }

    function withdraw(address payable _to) external {
        require(msg.sender == owner, "you are not owner!");
       _to.transfer(address(this).balance);
    }
}