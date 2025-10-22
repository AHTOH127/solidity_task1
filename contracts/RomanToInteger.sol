// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract RomanToInteger {
   // 罗马字符到数值的映射表
    mapping(bytes1 => uint) private _romanValues = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    };

    function convert(string calldata roman) external pure returns (uint) {
        bytes memory romanBytes = bytes(roman);
        uint len = romanBytes.length;
        if (len == 0) return 0;

        uint result = 0;
        // 遍历所有字符（最后一个字符单独处理）
        for (uint i = 0; i < len; i++) {
            uint current = _romanValues[romanBytes[i]];
            // 校验无效字符
            if (current == 0) revert("Invalid Roman character");
            
            // 若当前字符不是最后一个，且当前值 < 下一个值，则用减法
            if (i < len - 1 && current < _romanValues[romanBytes[i + 1]]) {
                result -= current;
            } else {
                result += current;
            }
        }

        return result;
    }
}