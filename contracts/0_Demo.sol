// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;


/// @title   一个简单的数据存储演示
/// @author  ljq
/// @notice  此和约仅用作最基本演示
/// @dev     面向开发者注释
/// @custom:xx  自定义描述  
contract Demo {

    address public owner;

    constructor() {
        // 可以用在 constructor 内获取当前合约地址
        owner = address(this);

        // 不可以在构造函数内调用函数，因为此时合约还没有完成构建好。
        // this.caller(); 相当于从外部调用 caller 方法
        // owner = this.caller();
    }

    function caller() external view returns (address) {
        return this.contractAds(); // 内部调用 external 可见性的函数
    }

    function contractAds() external view returns (address) {
        return address(this);
    }

    // 返回 true
    function test() public pure returns (bool a,bool b,bool c) {
        a = 1 wei == 1;
        b = 1 gwei == 1e9;
        c = 1 ether == 1e18;
    }

}

/////////////////////////////////////
/// 合约属性:type 关键字
contract Hello {
    string public message = "Hello World!";
}

contract Demo1 {
    function name() external pure returns (string memory) {
        return type(Hello).name;
    }

    function creationCode() external pure returns (bytes memory) {
        return type(Hello).creationCode;
    }
    function runtimeCode() external pure returns (bytes memory) {
        return type(Hello).runtimeCode;
    }
}



///////////////////////////////////////
/// interface: 接口

interface AnimalEat {
    function eat() external returns (string memory);
}

contract Animal {
    function test(address _addr) external returns (string memory) {
        AnimalEat general = AnimalEat(_addr);
        return general.eat();
    }
}

contract Cat {
    uint256 public age;

    function eat() public returns (string memory) {
        age++;
        return "cat eat fish";
    }

    function sleep1() public pure returns (string memory) {
        return "sleep1";
    }
}

contract Dog {
    uint256 public age;

    function eat() public returns (string memory) {
        age += 2;
        return "dog miss you";
    }

    function sleep2() public pure returns (string memory) {
        return "sleep2";
    }
}

/// payable 意味着在调用这个函数的消息中可以附带 Eth。
contract Payable {
/// 使用 payable 标记的函数/地址可以用于发送和接收 Eth。
    function deposit1() external payable {}

    function deposit2() external {}


    // 通过 balance 属性，来查看余额。
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // payable 标记地址, 转全部余额到合约地址
    function withdraw() external {
        payable(msg.sender).transfer(address(this).balance);
    }

}
