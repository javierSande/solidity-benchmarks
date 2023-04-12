const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");
const { enabled } = require("hardhat-gas-reporter");

const SIZE = 100;

const ASC_ORD = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,
  21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,
  43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,
  65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,
  87,88,89,90,91,92,93,94,95,96,97,98,99,100
];

const DESC_ORD = [100,99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,
  83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,
  60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,
  37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,
  14,13,12,11,10,9,8,7,6,5,4,3,2,1
];

const RND_ORD = [36,64,95,9,67,68,84,24,70,49,43,92,98,55,94,62,48,26,
  18,58,31,16,71,61,56,1,89,52,75,83,87,76,73,53,37,96,80,66,13,6,28,
  25,54,65,93,45,30,81,40,2,3,38,60,57,46,74,17,7,97,21,23,59,42,29,33,
  39,77,91,99,14,47,50,8,22,4,5,27,79,51,32,88,10,41,12,34,100,44,78,
  72,69,90,20,15,63,86,85,82,11,19,35
];

describe("Test Array Contract", function () {

  describe("TestHeapSort -- ASC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(ASC_ORD, SIZE);

      await test.testHeapSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("TestHeapSort -- DESC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(DESC_ORD, SIZE);

      await test.testHeapSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("TestHeapSort -- RND", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testHeapSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testIntersectionSort -- ASC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(ASC_ORD, SIZE);

      await test.testIntersectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testIntersectionSort -- DESC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(DESC_ORD, SIZE);

      await test.testIntersectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testIntersectionSort -- RND", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testIntersectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testSelectionSort -- ASC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(ASC_ORD, SIZE);

      await test.testSelectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testSelectionSort -- DESC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(DESC_ORD, SIZE);

      await test.testSelectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testSelectionSort -- RND", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testSelectionSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSort -- ASC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(ASC_ORD, SIZE);

      await test.testBubleSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSort -- DESC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(DESC_ORD, SIZE);

      await test.testBubleSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSort -- RND", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testBubleSort();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSortOptimized -- ASC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(ASC_ORD, SIZE);

      await test.testBubleSortOptimized();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSortOptimized -- DESC", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(DESC_ORD, SIZE);

      await test.testBubleSortOptimized();

      expect(await test.getResult()).to.equal(true);
    });
  });

  describe("testBubleSortOptimized -- RND", function () {

    it("Should return", async function () {
      const Test = await ethers.getContractFactory("TestSortLib");
      const test = await Test.deploy(RND_ORD, SIZE);

      await test.testBubleSortOptimized();

      expect(await test.getResult()).to.equal(true);
    });
  });

});
