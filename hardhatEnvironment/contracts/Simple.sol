// SPDX-License-Identifier: BSD-4-Clause
pragma solidity >=0.8.4;

contract Simple {
  uint[] a;
  uint[] b;
  uint[] c;
  uint size;

  constructor(uint n) {
    size = n;
    for(uint256 i = 0; i < n; i++)
    {
      a.push(0);
      b.push(i);
      c.push(i * 2);
    }
  }

  function sumArrays() public {
    for(uint256 i = 0; i < size; i++)
       a[i] = b[i] + c[i];
  }
}
