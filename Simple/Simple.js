const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { enabled } = require("hardhat-gas-reporter");

const SIZE = 100;

describe("Simple Loop", function () {

  describe("Test", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("Simple");
      const test = await Test.deploy(SIZE);

      await test.sumArrays();
    });
  });
});
