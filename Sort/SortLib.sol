// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

library SortLib {

  function getParentI(uint256 index) private pure returns (uint256 pI) {
    uint256 i = index - 1;
    pI = i/2;
  }

  function getLeftChildI(uint256 index) private pure returns (uint256 lcI) {
    uint256 i = index * 2;
    lcI = i + 1;
  }

  function heapSort(uint256[] storage self) internal {
    uint256 end = self.length - 1;
    uint256 start = getParentI(end);
    uint256 root = start;
    uint256 lChild;
    uint256 rChild;
    uint256 swap;
    uint256 temp;
    while(start >= 0){
      root = start;
      lChild = getLeftChildI(start);
      while(lChild <= end){
        rChild = lChild + 1;
        swap = root;
        if(self[swap] < self[lChild])
          swap = lChild;
        if((rChild <= end) && (self[swap]<self[rChild]))
          swap = rChild;
        if(swap == root)
          lChild = end+1;
        else {
          temp = self[swap];
          self[swap] = self[root];
          self[root] = temp;
          root = swap;
          lChild = getLeftChildI(root);
        }
      }
      if(start == 0)
        break;
      else
        start = start - 1;
    }
    while(end > 0){
      temp = self[end];
      self[end] = self[0];
      self[0] = temp;
      end = end - 1;
      root = 0;
      lChild = getLeftChildI(0);
      while(lChild <= end){
        rChild = lChild + 1;
        swap = root;
        if(self[swap] < self[lChild])
          swap = lChild;
        if((rChild <= end) && (self[swap]<self[rChild]))
          swap = rChild;
        if(swap == root)
          lChild = end + 1;
        else {
          temp = self[swap];
          self[swap] = self[root];
          self[root] = temp;
          root = swap;
          lChild = getLeftChildI(root);
        }
      }
    }
  }


  function intersectionSort(uint256[] storage list) internal {
      uint256 pos;
      uint256 tmp;
      for (uint256 i = 1; i < list.length; i++) {
         pos = i;
         while ((pos > 0) && (list[pos-1] > list[pos]))
         {
            tmp = list[pos];
            list[pos] = list[pos - 1];
            list[pos -1] = tmp;
            pos--;
         }
      }
  }

  function selectionSort(uint256[] storage list) internal {
     for (uint256 i = 0; i < list.length - 1; i++) {
        uint256 minor = i;
        for (uint256 j = i + 1; j < list.length; j++) {
           if (list[j] < list[minor]) {
              minor = j;
           }
        }
        if (minor > i) {
          uint256 tmp = list[i];
          list[i] = list[minor];
          list[minor] = tmp;
        }
     }
  }

  function bubleSort(uint256[] storage list) internal {
     for (uint256 i = 0; i < list.length - 1; i++) {
        for (uint256 j = list.length - 1; j > i; j--) {
           if (list[j] < list[j - 1]) {
             uint256 tmp = list[j];
             list[j] = list[j - 1];
             list[j - 1] = tmp;
           }
        }
     }
  }

  function bubleSortOptimized(uint256[] storage list) internal {
    bool changed = true;
    uint256 i = 0;
    while ( i < list.length - 1 && changed) {
        changed = false;
        for (uint256 j = list.length - 1; j > i; j--) {
            if (list[j] < list[j - 1]) {
                uint256 tmp = list[j];
                list[j] = list[j - 1];
                list[j - 1] = tmp;
                changed = true;
            }
        }
    }
  }
}

contract TestSortLib {

  uint256 size;
  uint256[] arr;
  uint256 sum = 0;

  bool result = false;

  constructor(uint256[] memory array, uint256 length) {
    size = length;

    for(uint256 i = 0; i < size; i++)
      arr.push(array[i]);
  }

  function getResult() public view returns(bool) {
    return result;
  }

  function testHeapSort() public returns (bool) {
    result = false;
    SortLib.heapSort(arr);
    for (uint256 i = 1; i < size; i++) {
      if (arr[i - 1] > arr[i])
        return false;
    }
    result = true;
    return result;
  }

  function testIntersectionSort() public returns (bool) {
    result = false;
    SortLib.intersectionSort(arr);
    for (uint256 i = 1; i < size; i++) {
      if (arr[i - 1] > arr[i])
        return false;
    }
    result = true;
    return result;
  }

  function testSelectionSort() public returns (bool) {
    result = false;
    SortLib.selectionSort(arr);
    for (uint256 i = 1; i < size; i++) {
      if (arr[i - 1] > arr[i])
        return false;
    }
    result = true;
    return result;
  }

  function testBubleSort() public returns (bool) {
    result = false;
    SortLib.bubleSort(arr);
    for (uint256 i = 1; i < size; i++) {
      if (arr[i - 1] > arr[i])
        return false;
    }
    result = true;
    return result;
  }

  function testBubleSortOptimized() public returns (bool) {
    result = false;
    SortLib.bubleSortOptimized(arr);
    for (uint256 i = 1; i < size; i++) {
      if (arr[i - 1] > arr[i])
        return false;
    }
    result = true;
    return result;
  }
}
