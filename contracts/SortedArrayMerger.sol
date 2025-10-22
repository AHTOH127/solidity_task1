// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21 <0.9.0;

contract SortedArrayMerger {

    /**
     * @dev 数组合并
     * @param arr1 第一个有序数组
     * @param arr2 第二个有序数组
     * @return 合并后的有序数组
     */
    function mergeSortedArrays(uint[] memory arr1, uint[] memory arr2) public pure returns (uint[] memory) {
        uint len1 = arr1.length;
        uint len2 = arr2.length;
        uint totalLen = len1 + len2;
        
        // 创建结果数组，长度为两个数组长度之和
        uint[] memory result = new uint[](totalLen);
        
        uint i = 0; // arr1的指针
        uint j = 0; // arr2的指针
        uint k = 0; // 结果数组的指针
        
        // 双指针遍历，比较并合并元素
        while (i < len1 && j < len2) {
            if (arr1[i] <= arr2[j]) {
                // arr1当前元素更小或相等，放入结果数组
                result[k] = arr1[i];
                i++; // 移动arr1指针
            } else {
                // arr2当前元素更小，放入结果数组
                result[k] = arr2[j];
                j++; // 移动arr2指针
            }
            k++; // 移动结果数组指针
        }
        
        // 处理arr1中剩余的元素（若有）
        while (i < len1) {
            result[k] = arr1[i];
            i++;
            k++;
        }
        
        // 处理arr2中剩余的元素（若有）
        while (j < len2) {
            result[k] = arr2[j];
            j++;
            k++;
        }
        return result;
    }
}