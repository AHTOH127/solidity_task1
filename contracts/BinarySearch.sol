// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21 <0.9.0;

contract BinarySearch {
     /**
     * @dev 二分查找
     * @param arr 升序排列的数组（必须有序，否则结果无效）
     * @param target 待查找的目标值
     * @return 目标值在数组中的索引（存在时）；-1（不存在时）
     */
    function binarySearch(uint[] memory arr, uint target) public pure returns (int256) {
        uint left = 0;
        uint right = arr.length - 1;

        // 边界处理：空数组直接返回-1
        if (arr.length == 0) {
            return -1;
        }

        // 循环缩小搜索范围
        while (left <= right) {
            // 计算中间索引（避免 left + right 溢出，改用 left + (right - left)/2）
            uint mid = left + (right - left) / 2;

            if (arr[mid] == target) {
                // 找到目标，返回索引（转换为int256以支持-1）
                return int256(mid);
            } else if (arr[mid] < target) {
                // 目标在右侧，移动左边界
                left = mid + 1;
            } else {
                // 目标在左侧，移动右边界
                right = mid - 1;
            }
        }

        // 循环结束仍未找到，返回-1
        return -1;
    }
}