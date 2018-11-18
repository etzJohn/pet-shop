pragma solidity ^0.4.17;

contract Adoption {
  address[16] public adopters;
  mapping(address => uint) public balances;
  event PaymentSuccess(bool result);

  modifier isValidPetId(uint petId) {
    require(petId >= 0 && petId <= 15);
    _;
  }

  modifier isPayment {
    require(msg.data.length == 0);
    _;
  }

  function adopt(uint petId) public isValidPetId(petId) returns (uint) {
    adopters[petId] = msg.sender;

    return petId;
  }

  function getAdopters() public view returns (address[16]) {
    return adopters;
  }

  function() public payable isPayment {
    balances[msg.sender] = balances[msg.sender] + msg.value;

    emit PaymentSuccess(true);
  }
}
