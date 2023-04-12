const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { enabled } = require("hardhat-gas-reporter");

const SIZE = 100;

const RND_ORD = [36,64,95,9,67,68,84,24,70,49,43,92,98,55,94,62,48,26,
  18,58,31,16,71,61,56,1,89,52,75,83,87,76,73,53,37,96,80,66,13,6,28,
  25,54,65,93,45,30,81,40,2,3,38,60,57,46,74,17,7,97,21,23,59,42,29,33,
  39,77,91,99,14,47,50,8,22,4,5,27,79,51,32,88,10,41,12,34,100,44,78,
  72,69,90,20,15,63,86,85,82,11,19,35
];

describe("Test Array Contract", function () {

  describe("TestMin", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestArray");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testMin();

      expect(await test.getResult()).to.equal(true);
    });
});

describe("TestMax", function () {

  it("Should return", async function () {
    const Test = await ethers.getContractFactory("TestArray");
    const test = await Test.deploy(RND_ORD, SIZE);

    await test.testMax();

    expect(await test.getResult()).to.equal(true);
  });
});

describe("TestSum", function () {

  it("Should return", async function () {
    const Test = await ethers.getContractFactory("TestArray");
    const test = await Test.deploy(RND_ORD, SIZE);

    await test.testSum();

    expect(await test.getResult()).to.equal(true);
  });
});
});
