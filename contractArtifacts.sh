#!/bin/bash

print_help()
{
    echo "Usage: ./contractArtifacts [-c compiler_path] CONTRACT [OPT_OPTIONS]"
    echo ""
    echo "CONTRACT: Solidity smart contract to be compiled"
    echo "OPT_OPTIONS: Compiler optimization options"
    echo "  -h: Help. Prints this help message and exits"
    echo "  -c compiler_path: Set compiler. Absolute path to the compiler solc executable"
}

print_info()
{
    echo "Contract File: $1"
    echo "Compiler Executable: $2"
    shift 2
    echo "Compiler Options: $@"
}

if [ "$#" -lt 1 ]; then
    print_help
    exit 1
fi

# Initial configiration

set -e

mode=($1)
compiler="solc"
outputDir="artifacts"
source=($1)

case $mode in 
    '-h')
        print_help
        exit 1
        ;; 
    '-c')
        if [ "$#" -lt 3 ]; then
            print_help
            exit 1
        fi
        compiler=($2)
        source=($3)
        shift 2
        ;;
esac

sourceFile=$(basename $source)

shift 1
compilerOutputOptions="--abi --bin --asm --ir --ir-optimized"
compilerOptions=${compilerOutputOptions}
compilerOptions+=" "
compilerOptions+=$@

print_info ${source} ${compiler} ${compilerOptions}

# Compilation

rm -rf ${outputDir}

${compiler} ${compilerOptions} -o ${outputDir} ${source} --overwrite > /dev/null

# Hardhat contract artifacts

cd "${outputDir}"
mkdir "contracts"
mkdir "contracts/${sourceFile}"

declare -a CONTRACTS
CONTRACTS=($(ls *.bin | sed -e 's/\.bin$//'))

for contract in ${CONTRACTS[@]}
do
    contractOutputPath="contracts/${sourceFile}"
    contractName=$contract
    abi=$(cat ${contract}.abi)
    bytecode=$(cat ${contract}.bin)
    json="{
        \"format\": \"hh-sol-artifact-1\",
        \"contractName\": \"${contractName}\",
        \"sourceName\": \"contracts/${sourceFile}\",
        \"abi\": ${abi},
        \"bytecode\": \"${bytecode}\",
        \"deployedBytecode\": \"${bytecode}\",
        \"linkReferences\": {},
        \"deployedLinkReferences\": {}
        }"

    echo $json > $contractOutputPath/$contractName.json
done

cd ..
echo "Compiler run successful. Hardhat contract artifact(s) can be found in directory artifacts/contracts".
