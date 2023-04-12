// SPDX-License-Identifier: BSD-4-Clause
pragma solidity >=0.8.4;

library VectorUtils {

    function dot(int256[] storage a, int256[] storage b) internal view returns (int256) {
        int256 total = 0e18;
        for (uint i=0; i<a.length; i++) {
            total += a[i] * (b[i]);
        }
        return total;
    }

    function add(int256[] storage a, int256[] storage b) internal view returns (int256[] memory) {
        int256[] memory result = new int256[](a.length);
        for (uint i=0; i<a.length; i++) {
            result[i] = a[i] + b[i];
        }
        return result;
    }

    function mul(int256[] storage a, int256 b) internal view returns (int256[] memory) {
        int256[] memory result = new int256[](a.length);
        for (uint i=0; i<a.length; i++) {
            result[i] = a[i] * (b);
        }
        return result;
    }
}

library MatrixUtils {
    using VectorUtils for int256[];

    function createMatrix(uint dim1, uint dim2) internal pure returns (int256[][] memory) {
        int256[][] memory result = new int256[][](dim1);
        for (uint i=0; i<dim1; i++) {
            result[i] = new int256[](dim2);
        }
        return result;
    }

    function outerProduct(int256[] storage a, int256[] storage b) internal view returns (int256[][] memory) {
        int256[][] memory result = createMatrix(a.length, b.length);
        for (uint i=0; i<a.length; i++) {
            for (uint j=0; j<b.length; j++) {
                result[i][j] = a[i] * b[j];
            }
        }
        return result;
    }

    function mul(int256[][] storage a, int256 b) internal view returns (int256[][] memory) {
        int256[][] memory result = createMatrix(a.length, a[0].length);
        for (uint i=0; i<a.length; i++) {
            for (uint j=0; j<a[0].length; j++) {
                result[i][j] = a[i][j] * b;
            }
        }
        return result;
    }

    function add(int256[][] storage a, int256[][] storage b) internal view returns (int256[][] memory) {
        int256[][] memory result = createMatrix(a.length, a[0].length);
        for (uint i=0; i<a.length; i++) {
            for (uint j=0; j<a[0].length; j++) {
                result[i][j] = a[i][j] + b[i][j];
            }
        }
        return result;
    }

    function add(int256[][] storage a, int256 b) internal view returns (int256[][] memory) {
        int256[][] memory result = createMatrix(a.length, a[0].length);
        for (uint i=0; i<a.length; i++) {
            for (uint j=0; j<a[0].length; j++) {
                result[i][j] = a[i][j] + b;
            }
        }
        return result;
    }

    function dot(int256[][] storage a, int256[][] storage b) internal view returns (int256[][] memory) {
        uint l1 = a.length;
        uint l2 = b[0].length;
        uint zipsize = b.length;
        int256[][] memory c = new int256[][](l1);
        for (uint fi=0; fi<l1; fi++) {
            c[fi] = new int256[](l2);
            for (uint fj=0; fj<l2; fj++) {
                int256 entry = 0e18;
                for (uint i=0; i<zipsize; i++) {
                    entry += a[fi][i] * b[i][fj];
                }
                c[fi][fj] = entry;
            }
        }
        return c;
    }

    function T(int256[][] storage a) internal view returns (int256[][] memory) {
        int256[][] memory transpose = new int256[][](a[0].length);
        for (uint j=0; j<a[0].length; j++) {
            transpose[j] = new int256[](a.length);
            for (uint i=0; i<a.length; i++) {
                transpose[j][i] = a[i][j];
            }
        }
        return transpose;
    }

    function diag(int256[][] storage a) internal view returns (int256[] memory) {
        int256[] memory diagonal_vector = new int256[](a.length);
        for (uint i=0; i<a.length; i++) {
            diagonal_vector[i] = a[i][i];
        }
        return diagonal_vector;
    }

    function sliceVector(int256[][] storage a, uint dim1_start, uint dim1_end, uint dim2_start, uint dim2_end) internal view returns (int256[] memory) {
        if (dim1_start == dim1_end) {
            uint length = dim2_end - dim2_start;
            int256[] memory result = new int256[](length);
            for (uint i=dim2_start; i < dim2_end; i++) {
                result[i] = a[dim1_start][i];
            }
            return result;
        } else {
            uint length = dim1_end - dim1_start;
            int256[] memory result = new int256[](length);
            for (uint i=dim1_start; i < dim1_end; i++) {
                result[i] = a[i][dim2_start];
            }
            return result;
        }
    }

    function sliceMatrix(int256[][] storage a, uint dim1_start, uint dim1_end, uint dim2_start, uint dim2_end) internal view returns (int256[][] memory) {
        uint dim1 = dim1_end - dim1_start;
        uint dim2 = dim2_end - dim2_start;
        int256[][] memory result = createMatrix(dim1, dim2);
        for (uint i=0; i<dim1; i++) {
            for (uint j=0; j<dim2; j++) {
                result[i][j] = a[i+dim1_start][j+dim2_start];
            }
        }
        return result;
    }

    function assign(int256[][] storage a, int256[][] storage b, uint i, uint j) internal view returns (int256[][] memory) {
        int256[][] memory result = a;
        for (uint ii=0; ii<b.length; ii++) {
            for (uint jj=0; jj<b[0].length; jj++) {
                result[ii+i][jj+j] = b[ii][jj];
            }
        }
        return result;
    }
}

contract TestMatrixLib {

    int256[][] matrixA;
    int256[][] matrixB;

    bool result = false;

    constructor(int256[][] memory a, int256[][] memory b) {
        matrixA = a;
        matrixB = b;
    }

    function getResult() public view returns(bool) {
        return result;
    }
    
    function testAddNum(int256 b) public returns (bool) {
        result = false;

        int256[][] memory m = MatrixUtils.add(matrixA, b);

        for(uint256 i = 0; i < matrixA.length; i++) {
            for(uint256 j = 0; j < matrixA[0].length; j++)
                if (m[i][j] != matrixA[i][j] + b)
                    return false;
        }

        result = true;
        return true;
    }

    function testAddMatrix() public returns (bool) {
        result = false;

        int256[][] memory m = MatrixUtils.add(matrixA, matrixB);

        for(uint256 i = 0; i < matrixA.length; i++) {
            for(uint256 j = 0; j < matrixA[0].length; j++)
                if (m[i][j] != matrixA[i][j] + matrixB[i][j])
                    return false;
        }

        result = true;
        return true;
    }

    function testMulNum(int256 b) public returns (bool) {
        result = false;

        int256[][] memory m = MatrixUtils.mul(matrixA, b);

        for(uint256 i = 0; i < matrixA.length; i++) {
            for(uint256 j = 0; j < matrixA[0].length; j++)
                if (m[i][j] != matrixA[i][j] * b)
                    return false;
        }

        result = true;
        return true;
    }

    function testDot() public returns (bool) {
        result = false;

        MatrixUtils.dot(matrixA, matrixB);

        result = true;
        return true;
    }

    function testOuterProduct() public returns (bool) {
        result = false;

        int256[][] memory m = MatrixUtils.outerProduct(matrixA[0], matrixB[0]);

        for(uint256 i = 0; i < matrixA.length; i++) {
            for(uint256 j = 0; j < matrixB.length; j++)
                if (m[i][j] != matrixA[0][i] * matrixB[0][j])
                    return false;
        }

        return true;
    }

    function testTranspose() public returns (bool) {
        result = false;

        int256[][] memory t = MatrixUtils.T(matrixA);

        for(uint256 i = 0; i < matrixA.length; i++) {
            for(uint256 j = 0; j < matrixA[0].length; j++)
                if (t[i][j] != matrixA[j][i])
                    return false;
        }

        result = true;
        return true;
    }

    function testDiagonal() public returns (bool) {
        result = false;

        int256[] memory d = MatrixUtils.diag(matrixA);

        for(uint256 i = 0; i < matrixA.length; i++)
            if (d[i] != matrixA[i][i])
                return false;

        result = true;
        return true;
    }
}
