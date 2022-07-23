pragma solidity ^0.8.1;

contract HoneyPot {
    // Todo: Implementation
    mapping (address => uint) public balances;
    
     function deposit() public payable {
        balances[msg.sender] += msg.value;
    }
}
