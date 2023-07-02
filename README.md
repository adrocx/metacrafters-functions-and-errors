## Functions and Errors - ETH + AVAX

This code demonstrates a simple smart contract written in Solidity that utilizes the require(), assert(), and revert() statements.

## Description

The contract SmartContract is designed to manage a minimum value requirement for transactions. It includes the following key components:

The owner variable stores the address of the contract owner and is set during contract deployment in the constructor.

The minValue variable represents the minimum value required for a transaction to be considered valid. It is initially set to 100.

The updateMinValue() function allows the contract owner to update the minimum value. It takes a new value as a parameter and checks two conditions using the require() statement:

The transaction sender must be the contract owner. If this condition is not met, the transaction reverts with an error message.
The new value must be greater than 0. If this condition is not met, the transaction reverts with an error message.
The transferWithMinValue() function enables transferring Ether to a specified recipient. It checks whether the amount being transferred is greater than or equal to the minValue using the assert() statement. If the condition is false, indicating that the transferred value is less than the minimum required, the transaction reverts.

The exampleRevert() function serves as an illustration of the revert() statement. It demonstrates how to explicitly revert a transaction with a custom error message.

These statements are used to enhance the security and reliability of the smart contract. The require() statement helps ensure that specific conditions are met before proceeding with the transaction, such as ownership or valid input values. The assert() statement is employed for internal consistency checks that should never fail under normal circumstances, allowing for early detection of errors. Lastly, the revert() statement offers the ability to revert a transaction explicitly, typically used when certain conditions are not met or to provide custom error messages.

By using these statements judiciously, the contract can enforce conditions, validate inputs, and ensure the integrity of its state, contributing to the overall security and robustness of the smart contract.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., project.sol). 

Copy and paste the following code into the file:

```
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
```
To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile project.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "project" contract from the dropdown menu, and then click on the "Deploy" button.

Confirm Contract Deployment: Once the deployment is successful, you will receive a transaction hash that represents the contract deployment transaction. You can use an Ethereum block explorer like Etherscan to search for the contract address associated with that transaction hash. This confirms that the contract is deployed on the Ethereum network.

## Authors

Aditya Raju

@[ADROCX6105](https://twitter.com/ADROCX6105)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
