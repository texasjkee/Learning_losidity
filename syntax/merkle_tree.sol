// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Tree {
   //Merkle tree 

    // H1  H2  H3  H4
    // TX1 TX2 TX3 TX4
    bytes32[] public hashes;
    string[4] transactions = [
       "TX1: John -> Tayler" 
       "TX2: John -> Tayler" 
       "TX3: John -> Tayler" 
       "TX4: John -> Tayler" 
       "TX5: John -> Tayler" 
    ];
    
    function encode(string memory input) public pure returns(bytes memory) {
        return abi.encodePacked(input);
    }

    function makeHash(string memory input) public pure returns(bytes32) {
       return keccak256(
        encode(input)
       ); 
    }
}