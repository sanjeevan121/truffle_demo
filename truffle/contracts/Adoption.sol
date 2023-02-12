// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Adoption{
    address[10] public adopters;

    function adopt(uint petId) public returns (uint){
        require(petId>=0 && petId<=10);
        adopters[petId]=msg.sender;
        return petId;
    }

    function getAdopters() public view returns(address[10] memory){
        return adopters;
    }
}