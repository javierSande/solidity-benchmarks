const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { enabled } = require("hardhat-gas-reporter");

const matrixA = [[77,5,68,52,15,42,52,22,18,54],
                 [5,64,19,33,48,67,83,5,38,57],
                 [32,56,8,11,34,76,41,42,93,13],
                 [62,52,0,10,98,44,33,17,100,45],
                 [69,99,95,47,10,24,29,80,19,59],
                 [96,49,76,57,50,79,53,22,25,0],
                 [57,96,39,67,32,74,33,60,85,86],
                 [84,17,74,32,46,93,14,75,73,98],
                 [5,7,27,0,89,79,28,0,15,10],
                 [33,68,90,6,60,91,2,62,60,4]
                ];

const matrixB = [[95,65,57,31,94,36,7,25,47,5],
                 [99,57,19,28,6,2,97,97,5,56],
                 [27,45,87,34,17,62,31,77,43,62],
                 [10,10,0,94,38,61,1,27,25,17],
                 [3,68,24,34,62,21,0,66,76,71],
                 [36,48,85,84,78,92,89,37,13,19],
                 [53,33,56,78,4,10,9,85,90,97],
                 [10,29,73,77,60,96,56,74,70,28],
                 [25,9,68,10,17,61,58,74,66,41],
                 [78,87,63,80,12,56,78,11,44,19]
                ];

describe("Test Matrix Contract", function () {

  describe("Test Add Number", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testAddNum(matrixA, 10);

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("Test Add Matrix", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testAddMatrix(matrixA, matrixB);

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("Test Multiply Number", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testMulNum(matrixA, 10);

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("Test Multiply Matrix", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testDot(matrixA, matrixB);

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("Test Tranpose Matrix", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testTranspose(matrixA);

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("Test Diagonal of Matrix", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestMatrixLib");
      const test = await Test.deploy();

      await test.testDiagonal(matrixA);

      expect(await test.getResult()).to.equal(true);
    });
  });
});
