pragma solidity ^0.4.0;

contract Etherbin {

    struct Bin {
        address owner;
        string content;
    }

    address owner;
    mapping(bytes32 => Bin) bins;

    event Log(string message, uint size, bytes array);

    function Etherbin() {
        owner = msg.sender;
        Bin memory initialBin = Bin (msg.sender, "Initial Content", true, false);
        bins["initialBin"] = initialBin;
    }

    function load(bytes32 name) constant returns (string, bool, bool) {
        Bin memory binFound = bins[name];
        return (binFound.content);
    }

    function put(bytes32 name, string content) {
        // checks if that name is already taken
        validated = bins[name].owner == address(0x0);
        // size validation
        validated = validated && bytes(content).length <= 1024 * 3 && bytes(content).length > 0;

        require(validated);

        Bin memory newBin = Bin (msg.sender, content);
        bins[name] = newBin;
    }

    function mortal() {
        owner = msg.sender;
    }

    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}
