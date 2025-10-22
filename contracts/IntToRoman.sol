// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract IntToRoman {
   // 使用固定数组存储罗马数字段
    uint256 private constant SEGMENT_COUNT = 13;
    
    // 数值数组
    uint256[SEGMENT_COUNT] private values = [
        1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
    ];
    
    // 符号数组
    string[SEGMENT_COUNT] private symbols = [
        "M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"
    ];
    
    /**
     * @dev 将整数转换为罗马数字（优化版本）
     * @param number 要转换的整数 (1-3999)
     * @return 对应的罗马数字字符串
     */
    function intToRoman(uint256 number) public view returns (string memory) {
        require(number >= 1 && number <= 3999, "Number must be between 1 and 3999");
        
        bytes memory result;
        
        for (uint256 i = 0; i < SEGMENT_COUNT; i++) {
            uint256 value = values[i];
            string memory symbol = symbols[i];
            
            while (number >= value) {
                result = abi.encodePacked(result, symbol);
                number -= value;
            }
            
            if (number == 0) {
                break;
            }
        }
        
        return string(result);
    }
}