// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


/// @title   一个简单的数据存储演示
/// @author  ljq
/// @notice  此和约仅用作最基本演示
/// @dev     面向开发者注释
/// @custom:xx  自定义描述  
contract Demo {
    // data
    // uint storedData;

    address public owner1;

    address public owner2;

    address public owner3;


    constructor() {
        // 和约地址
        owner1 = address(this); 
        
        // 和约创建者地址
        owner2 = msg.sender;
    }


    // 和约调用者地址 
    function fn() public view returns(address){
        return msg.sender;
    }


    // /// @notice 存储 x
    // /// @param _x: storeData 将要修改的值
    // /// @dev  将数字存储在状态变量 storeData 中
    // function set(uint _x) public {
    //     storedData = _x;
    // }   


    // /// @notice 返回存储
    // function get() public view returns (uint) {
    //     return storedData;
    // }

}

