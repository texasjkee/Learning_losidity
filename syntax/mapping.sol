// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Gas {
   mapping(address => uint) payments; 
   
   function pay() external payable {
        require(msg.sender != address(0), "zero address");
        payments[msg.sender] = msg.value;
   }

   function pay2() external payable {
        address _from = msg.sender;
        require(_from != address(0), "zero address");
        payments[_from] = msg.value;
   }
}