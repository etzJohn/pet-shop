pragma solidity ^0.4.17;

contract Adoption {
  address[16] public adopters;
  mapping(address => uint) public balances;

  function adopt(uint petId) public payable returns (uint) {
    require(petId >= 0 && petId <= 15);

    adopters[petId] = msg.sender;

    return petId;
  }

  function getAdopters() public view returns (address[16]) {
    return adopters;
  }

  function() public payable {
    balances[msg.sender] = balances[msg.sender] + msg.value;
  }
}
