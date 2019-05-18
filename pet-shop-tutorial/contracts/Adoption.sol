pragma solidity ^0.5.0;

contract Adoption {
address[16] public adopters;
uint[16] public price;

    constructor() public {
        for (uint i=0;i<16;++i) {
            price[i] = 1 ether;
        }
    }

    // Adopting a pet
    function adopt(uint petId) public payable returns (uint) {
        require(petId >= 0 && petId <= 15);
        require(msg.value >= price[petId]);
        price[petId] *= 120;
        price[petId] /= 100;
        adopters[petId] = msg.sender;
        return petId;
    }

    function getAdopters() public view returns (address[16] memory){
        return adopters;

    }

    function getprices() public view returns (uint[16] memory){
        return price;

    }
}