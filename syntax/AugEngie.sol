// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract AugEngie {

   address public owner;
   uint constant DURATION = 2 days; //2 * 24 * 60 * 60
   uint constant FEE = 10; //10% 
   //immutable

   struct Auction {
        address payable seller;
        uint startingPrice;
        uint finalPrice;
        uint discountRate;
        uint startAt;
        uint endAt;
        string item;
        bool stopped;
   } 
   
   Auction[] public auctions;
   
    event AuctionCreated(uint index, string itemName, uint startingPrice, uint duration);

    constructor() {
        owner = msg.sender;
    }
   
    function createAuction(uint _startingPrice, uint _discountRate, string calldata _item, uint _duration) external {
        uint duration = _duration == 0 ? DURATION : _duration;
        
        require(_startingPrice >= _discountRate * duration, "incorrect starting price");
        
        Auction memory newAuction = Auction({
            seller: payable(msg.sender),
            startingPrice: _startingPrice,
            finalPrice: _startingPrice,
            discountRate: _discountRate,
            startAt: block.timestamp,
            endAt: block.timestamp + duration,
            item: _item,
            stopped: false
        });
        
        emit AuctionCreated(auctions.length - 1, _item, _startingPrice, duration);
    }
    
    function getPriceFor(uint index) public view returns(uint) {
        Auction memory cAuction = auctions[index];
        require(!cAuction.stopped, "stopped!");
        uint elapsed = block.timestamp - cAuction.startAt;    
        uint discount = cAuction.discountRate * elapsed;
        return cAuction.startingPrice - discount;
    }
    
    function buy(uint index) external payable {
        Auction memory cAuction = auctions[index];
        require(!cAuction.stopped, "stopped!");
        require(block.timestamp < cAuction.endAt, "ended!");
        uint cPrice = getPriceFor(index);
        require(msg.value >= cPrice, "not enough funds!");
        cAuction.stopped = true;
        cAuction.finalPrice = cPrice;
        uint refund = msg.value - cPrice;
        if(refund > 0) {
            payable(msg.sender).transfer(refund);
        }
        cAuction.seller.transfer(
           cPrice - ((cPrice * FEE) / 100) 
        );
    }
}