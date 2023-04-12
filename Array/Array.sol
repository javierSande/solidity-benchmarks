// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0;

/*
#    Copyright (C) 2017  alianse777

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

/** Array wraper
* min() - returns minimal array element
* max() - returns maximal array element
* sum() - returns sum of all array elements
* set(uint []) - set array
* get() - returns stored array
* sort() - sorts all array elements
*/


//Uint Array


contract UintArray {
    uint[] private data;

    constructor(uint[] memory _data) {
        data = new uint[](_data.length);
        for(uint i = 0;i < _data.length;i++) {
            data[i] = _data[i];
        }
    }

    /**
     * @dev Returns minimal element in array
     * @return uint
     */
    function min() public view returns (uint) {
        uint minimal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] < minimal){
                minimal = data[i];
            }
        }
        return minimal;
    }
    
    /**
     * @dev Returns minimal element's index
     * @return uint
     */
    function imin() public view returns (uint) {
        uint minimal = 0;
        for(uint i;i < data.length;i++){
            if(data[i] < data[minimal]){
                minimal = i;
            }
        }
        return minimal;
    }

    /**
     * @dev Returns maximal element in array
     * @return uint
     */
    function max() public view returns (uint) {
        uint maximal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] > maximal){
                maximal = data[i];
            }
        }
        return maximal;
    }
    
    /**
     * @dev Returns maximal element's index
     * @return uint
     */
    function imax() public view returns (uint) {
        uint maximal = 0;
        for(uint i;i < data.length;i++){
            if(data[i] > data[maximal]){
                maximal = i;
            }
        }
        return maximal;
    }
    
    /**
     * @dev Compute sum of all elements
     * @return uint
     */
    function sum() public view returns (uint) {
        uint S;
        for(uint i;i < data.length;i++){
            S += data[i];
        }
        return S;
    }

    /**
     * @dev assign new array pointer from _data
     * @param _data is array to assign
     */
    function set(uint[] calldata _data) public {
        data = _data;
    }

    /**
     * @dev Get the contents of array
     * @return uint[]
     */
    function get() public view returns (uint[] memory) {
        return data;
    }
    
    function at(uint i) public view returns (uint) {
        return data[i];
    }

    function sort_item(uint pos) internal returns (bool) {
        uint w_min = pos;
        for(uint i = pos;i < data.length;i++) {
            if(data[i] < data[w_min]) {
                w_min = i;
            }
        }
        if(w_min == pos) return false;
        uint tmp = data[pos];
        data[pos] = data[w_min];
        data[w_min] = tmp;
        return true;
    }
    
    /**
     * @dev Sort the array
     */
    function sort() public {
        for(uint i = 0;i < data.length-1;i++) {
            sort_item(i);
        }
    }
}


// Int Array


contract IntArray {
    int [] private data;
    constructor(int[] memory _data) {
        data = _data;
    }

    /**
     * @dev Returns minimal element in array
     * @return int
     */
    function min() public view returns (int) {
        int minimal = data[0];
        for(uint i;i < data.length;i++){
            if(data[i] < minimal){
                minimal = data[i];
            }
        }
        return minimal;
    }
    
    /**
     * @dev Returns minimal element's index
     * @return uint
     */
    function imin() public view returns (uint) {
        uint minimal = 0;
        for(uint i;i < data.length;i++){
            if(data[i] < data[minimal]){
                minimal = i;
            }
        }
        return minimal;
    }

    /**
     * @dev Returns maximal element in array
     * @return int
     */
    function max() public view returns (int) {
        int maximal = data[0];
        for(uint i;i < data.length;i++) {
            if(data[i] > maximal) {
                maximal = data[i];
            }
        }
        return maximal;
    }
    
    /**
     * @dev Returns maximal element's index
     * @return uint
     */
    function imax() public view returns (uint) {
        uint maximal = 0;
        for(uint i;i < data.length;i++){
            if(data[i] > data[maximal]){
                maximal = i;
            }
        }
        return maximal;
    }

    /**
     * @dev Compute sum of all elements
     * @return int
     */
    function sum() public view returns (int) {
        int S;
        for(uint i;i < data.length;i++) {
            S += data[i];
        }
        return S;
    }

    function set(int[] calldata _data) public {
        data = _data;
    }

    function get() public view returns (int[] memory) {
        return data;
    }
    
    function at(uint i) public view returns (int) {
        return data[i];
    }

    function sort_item(uint pos) internal returns (bool) {
        uint w_min = pos;
        for(uint i = pos;i < data.length;i++) {
            if(data[i] < data[w_min]) {
                w_min = i;
            }
        }
        if(w_min == pos) return false;
        int tmp = data[pos];
        data[pos] = data[w_min];
        data[w_min] = tmp;
        return true;
    }
    
    /**
     * @dev Sort the array
     */
    function sort() public {
        for(uint i = 0;i < data.length-1;i++) {
            sort_item(i);
        }
    }
}

contract TestArray {

    uint size;
    UintArray uArr;
    IntArray arr;

    uint sum = 0;

    bool result = false;

    constructor(uint256[] memory array, uint256 length) {
        size = length;

        uint[] memory v1 = new uint[](size);
        int[] memory v2 = new int[](size);
        for(uint i = 0;i < size;i++) {
            v1[i] = array[i];
            v2[i] = int(array[i]);
            sum += array[i];
        }

        uArr = new UintArray(v1);
        arr = new IntArray(v2);
    }

    function getResult() public view returns(bool) {
      return result;
    }

    function testMin() public returns (bool) {
        result = false;
        if(uint(uArr.min()) != 1) {
            return false;
        }
        if(uint(arr.min()) != 1) {
            return false;
        }

        result = true;
        return result;
    }

    function testMax() public returns (bool) {
        result = false;
        if(uint(uArr.max()) != size) {
            return false;
        }
        if(uint(arr.max()) != size) {
            return false;
        }

        result = true;
        return result;
    }

    function testSum() public returns (bool) {
      result = false;
      if (uArr.sum() != sum) return false;
      if (arr.sum() != int(sum)) return false;

      result = true;
      return result;
    }

    function testSort() public returns (bool) {
        result = false;
        uArr.sort();
        for (uint i = 0; i < size; i++) {
            if (uArr.at(i) != i + 1)
                return false;
        }

        arr.sort();
        for (uint i = 0; i < size; i++) {
            if (arr.at(i) != int(i + 1))
                return false;
        }

        result = true;
        return result;
    }
}
