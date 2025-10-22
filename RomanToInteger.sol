// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract RomanToInteger {
    // 罗马数字字符到数值的映射
    mapping(bytes1 => uint256) private romanValues;
    
    constructor() {
        // 初始化罗马数字映射
        romanValues['I'] = 1;
        romanValues['V'] = 5;
        romanValues['X'] = 10;
        romanValues['L'] = 50;
        romanValues['C'] = 100;
        romanValues['D'] = 500;
        romanValues['M'] = 1000;
    }
    
    /**
     * @dev 将罗马数字字符串转换为整数
     * @param roman 罗马数字字符串（只包含 I,V,X,L,C,D,M）
     * @return 对应的整数值
     */
    function romanToInt(string memory roman) public view returns (uint256) {
        bytes memory romanBytes = bytes(roman);
        uint256 length = romanBytes.length;
        
        if (length == 0) {
            return 0;
        }
        
        uint256 result = 0;
        
        for (uint256 i = 0; i < length; i++) {
            uint256 current = getValue(romanBytes[i]);
            
            // 如果当前字符不是最后一个，且当前值小于下一个值，则减去当前值
            if (i < length - 1) {
                uint256 next = getValue(romanBytes[i + 1]);
                if (current < next) {
                    result -= current;
                    continue;
                }
            }
            
            result += current;
        }
        
        return result;
    }
    
    /**
     * @dev 获取单个罗马数字字符的值
     * @param c 罗马数字字符
     * @return 对应的数值
     */
    function getValue(bytes1 c) public view returns (uint256) {
        uint256 value = romanValues[c];
        require(value != 0, "Invalid Roman numeral character");
        return value;
    }
}