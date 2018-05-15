pragma solidity ^0.4.23;

contract StorageCalculator {
    
    /**
     * @dev This function gives the storage pointer to a key of a mapping in storage
     * @param _storageIndex The position of the array in storage (if it is the first: 0, the second: 1, and so on)
     * @param _mappingKey The key of the mapping
     * @return the storage pointer that could be used in, for example, eth_getStorageAt
     */
    function getStorageMappingPositionAndIndex(uint256 _storageIndex, uint256 _mappingKey) public pure returns(bytes32) {
        return keccak256(_mappingKey, _storageIndex);
    }
    
    /**
     * @dev This function gives the storage pointer to an index of a dynamic array in storage
     * @param _storageIndex The position of the array in storage (if it is the first: 0, the second: 1, and so on)
     * @param _arrayIndex The index of the element inside the array
     * @return the storage pointer that could be used in, for example, eth_getStorageAt
     */
    function getStorageArrayPositionAndIndex(uint256 _storageIndex, uint256 _arrayIndex) public pure returns (bytes32) {
        bytes32 base = keccak256(_storageIndex);
        uint256 baseUint = uint256(base);
        return bytes32(baseUint + _arrayIndex);
    }
}

