pragma solidity ^0.4.15;

contract Reentrancy {

    mapping(address => uint) private balances;

    event LogString(string s);
    event LogBool(bool s);

    function withdraw() public {
        LogString("withdrawing");
        bool result = msg.sender.call.value(balances[msg.sender])();
        LogBool(result);
        balances[msg.sender] = 0;
    }

    function deposit() payable {
        LogString("Depositing");
        balances[msg.sender] += msg.value;
    }

    function getBalance() returns (uint) {
        return this.balance;
    }

    function getBalanceOf(address addr) returns (uint) {
        return balances[addr];
    }
}
