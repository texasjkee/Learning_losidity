// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Test {
    //Dynamic Array 
    uint[] public myDynamicArray;
    uint public len;
    
    function demoDyArr() public {
       myDynamicArray.push(1); 
       myDynamicArray.push(2); 
       len = myDynamicArray.length; 
    }

    function demoMemArr() public view returns(uint[] memory){
        uint[] memory tempArray = new uint[](10);
        tempArray[0] = 1;
        return tempArray;
    }


    //Nested Array 
    uint[5][3] public myArray;
   
    function demoArray() public {
        myArray = [
            [1,2,3],
            [8,4,7]
        ];
    }    

   //Enum 
   enum Status {Paid, Delived, Recieved}
   Status public currentStatus;

   function demoEnum() public {
        currentStatus = Status.Paid;
   }
}