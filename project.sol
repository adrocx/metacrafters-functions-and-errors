// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartContract {
    address public owner;
    uint256 public minValue = 100;

    event ValueUpdated(uint256 newValue);

    constructor() {
        owner = msg.sender;
    }

    function updateMinValue(uint256 newValue) external {
        require(msg.sender == owner, "Only the contract owner can update the minimum value");
        require(newValue > 0, "New value must be greater than 0");
        emit ValueUpdated(newValue);
        minValue = newValue;
    }

    function transferWithMinValue(address recipient) external payable {
        assert(msg.value >= minValue);
        payable(recipient).transfer(msg.value);
    }

    function exampleRevert() external pure {
        revert("This transaction is reverted with a custom message");
    }

}
