// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Auc {
    
    mapping (address => uint) public myMapping;
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
   
    string public myString = "string"; // storage 

    function receiveFunds() public payable {
        myMapping[msg.sender] = msg.value;
    }

    function transferTo(address targetAddress, uint amount) public  {
        address payable _to = payable(targetAddress);
        _to.transfer(amount);
    }

    function getBalance(address targetAddress) public view returns(uint) {
        return targetAddress.balance;
    }

    function demo(string memory myMemoryStr) public {
        myString = myMemoryStr;
    }
}

