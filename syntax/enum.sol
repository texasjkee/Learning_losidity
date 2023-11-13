// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Test {
   
    struct Payment {
        uint amount;
        uint timestamp;
        address from;
        string message;
    }
    
   struct Balance {
        uint totalPayments;
        mapping(uint => Payment) payments;
   } 
   
   mapping(address => Balance) public balances;

    function getPayment(address _addr, uint _index) public view returns(Payment memory) {
        return balances[_addr].payments[_index];
    }  

    function pay(string memory message) public payable {
        uint paymentNum = balances[msg.sender].totalPayments; 
        balances[msg.sender].totalPayments++;

        Payment memory newPayment = Payment(
            msg.value,
            block.timestamp,
            msg.sender,
            message
        );
        
        balances[msg.sender].payments[paymentNum] = newPayment; 
   }
     //Dynamic Array 
    // uint[] public myDynamicArray;
    // uint public len;

//     function demoDyArr() public {
//        myDynamicArray.push(1); 
//        myDynamicArray.push(2); 
//        len = myDynamicArray.length; 
//     }

//     function demoMemArr() public view returns(uint[] memory){
//         uint[] memory tempArray = new uint[](10);
//         tempArray[0] = 1;
//         return tempArray;
//     }

//     //Nested Array 
//     uint[5][3] public myArray;
   
//     function demoArray() public {
//         myArray = [
//             [1,2,3],
//             [8,4,7]
//         ];
//     }    

//    //Enum 
//    enum Status {Paid, Delived, Recieved}
//    Status public currentStatus;

//    function demoEnum() public {
//         currentStatus = Status.Paid;
//    }
}

