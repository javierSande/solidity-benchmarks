# Solidity benchmarks

A set of benchmarks to evaluate Solidity compiler optimizations.

## Benchmarks

Each benchmark is composed by one Solidity file containing one or many contracts and libraries with the code being executed. Additionally, each folder contains a JS test file to execute the tests using a development network (Hardhat).

### Arrays

This benchmark contains two Solidity contracts implementing a integer array management library (UintArray and IntArray). In addition to that, it contains the contract TestArray composed of one instance of each array contract and several funtions to test the libraries.

Libraries source: https://github.com/alianse777/solidity-standard-library

### Matrix

This benchmark contains Solidity libraries for matrix and vector management (VectorUtils and MatrixUtils). In addition to that, it contains the contract TestSortLib containing several funtions to test the library.

Library source: https://github.com/NTA-Capital/SolMATe

### Sort

This benchmark contains a Solidity library implementing different array sorting methods. In addition to that, it contains the contract TestArray composed of one instance of each array contract and several funtions to test the libraries.

## Enviroment

The benchmarks can be executed using the [Hardhat](https://hardhat.org) development enviroment.

