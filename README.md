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

The benchmarks can be executed using the [Hardhat](https://hardhat.org) development enviroment on Linux and MacOS computers. Folder `hardhatEnvironment` includes a Hardhat project with the smart contracts cource code and tests needed to run the benchmark.

### Setup

In order to execute the benchmark using the provided Hardhat project we must:

1. Install [Node.js](https://nodejs.org/en) on your computer.
2. Install Hardhat on the computer using the [Hardhat installation guide](https://hardhat.org/hardhat-runner/docs/getting-started#installation).
3. Intall the Hardhat [gas reporter](https://www.npmjs.com/package/hardhat-gas-reporter) tool using the command `npm install hardhat-gas-reporter --save-dev`.

### Test execution

In order to executeute the execute the benchmark tests we have to:
1. Open the terminal on the `hardhatEnvironment` folder.
2. Compile the contracts with command `npx hardhat compile`.
3. Execute the command `npx hardhat test`. If we want to only execute one specific test suite you can use the command `npx hardhat test test/<suite>.js`. In the case we wanted to execute the tests for the Sort library, we should execute `npx hardhat test test/SortLibTests.js`.

This will execute the test over the smart contracts compiled using the version of the Solidity compiler set as default by Hardhat.

### Custom compilation

In order to execute the tests over smart contracts compiled using any compiler version of the Solidity compiler, including experimental versions, we provide the script `contractArtifacts.sh`. This script will compile the specified source code and create the corresponding artifacts to exetute them in Hardhat.

In order to compile the smart contracts using a custom Solidity compiler we must:
1. Open a tetminal,
2. Execute `chmod +x contractArtifacts.sh`.
3. Execute `./contractArtifacts.sh <source_file> [<optimization_options>]`, where:
* `source_file` is the path to the Solidity source file containing the contracts and libraries being executed.
* If we want to apply any optimization, `optimization_options` is the list of the compiler optimization options, as specified by the compiler documentation.

Doing this we will be compiling the source code usign the compiler version set as default on our computer (`solc --version`). If we want to compile using a different version, especially if we want to use an experimental or customized verison, we have to specify the absolute path to the compiler executable (`solc`): `./contractArtifacts.sh -c <path_solc> <source_file> [<optimization_options>]`.
