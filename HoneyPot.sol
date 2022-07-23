pragma solidity ^0.8.1;

contract HoneyPot {
    // Todo: Implementation
    mapping (address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(baqlances[msg.sender] > 0);
        (bool success, ) = msg.sender.call{ value: balances[msg.sender] }("");
        if (!success){
            revert();
        }
        balances[msg.sender]= 0;
    }
}
