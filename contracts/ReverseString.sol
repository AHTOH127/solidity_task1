// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21 <0.9.0;

// 反转字符串
contract ReverserString {
    function reversertStr(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        uint len = strBytes.length;
        
        // 字符串判空
        if (len == 0) {
            return str;
        }

        // 首尾交换完成反转
        for (uint i = 0; i < len / 2; i++) {
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[len - 1 - i];
            strBytes[len - 1 - i] = temp;
        }
        
        return string(strBytes);
    }
}
