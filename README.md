# Solidity benchmarks

A set of benchmarks to evaluate Solidity compiler optimizations.

## Benchmarks

Each benchmark is composed by one Solidity file containing one or many contracts and libraries with the code being executed. Additionally, each folder contains a JS test file to execute the tests using a development network (Hardhat).

### Simple

This simple benchmark contains a single Solidity contracts with one function adding up the values of two storage array into another storage array.

### Arrays

This benchmark contains two Solidity contracts implementing a integer array management library (UintArray and IntArray). In addition to that, it contains the contract TestArray composed of one instance of each array contract and several funtions to test the libraries.

Libraries source: https://github.com/alianse777/solidity-standard-library

### Matrix

This benchmark contains Solidity libraries for matrix and vector management (VectorUtils and MatrixUtils). In addition to that, it contains the contract TestSortLib containing several funtions to test the library.

Library source: https://github.com/NTA-Capital/SolMATe

### Sort

This benchmark contains a Solidity library implementing different array sorting methods. In addition to that, it contains the contract TestArray composed of one instance of each array contract and several funtions to test the libraries.

## Testing enviroment

The benchmarks can be executed using the [Hardhat](https://hardhat.org) development enviroment on Linux and MacOS computers. Folder`hardhatEnvironment` includes a Hardhat project with the smart contracts cource code and tests needed to run the benchmark.

### Setup

In order to execute the benchmark using the provided Hardhat project you must:

1. Install [Node.js](https://nodejs.org/en) on your computer.
2. Install Hardhat on your computer using the [Hardhat installation guide](https://hardhat.org/hardhat-runner/docs/getting-started#installation).
3. Intall the Hardhat [gas reporter](https://www.npmjs.com/package/hardhat-gas-reporter) tool using the command `npm install hardhat-gas-reporter --save-dev`.

