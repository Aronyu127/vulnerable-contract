// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {FibonacciLib} from "../src/FibonacciLib.sol";
import {FibonacciBalance} from "../src/FibonacciBalance.sol";
contract FibonacciBalaneTest is Test {
    FibonacciLib public fibonacciLib;
    FibonacciBalance public fibonacciBalance;
    address attacker;
    function setUp() public {
        fibonacciLib = new FibonacciLib();
        fibonacciBalance = new FibonacciBalance(address(fibonacciLib));
        attacker = makeAddr("attacker");
        vm.deal(address(fibonacciBalance), 10 ether);
        vm.deal(attacker, 5 ether);
    }

    function testWithdraw() public {
        vm.startPrank(attacker);
        //Do something
        
        fibonacciBalance.withdraw{value: 5 ether}();
        assertEq(attacker.balance, 15 ether);
        vm.stopPrank();
    }
}

// 在攻擊者只擁有 5 ether 的情況下，攻擊者可以從 FibonacciBalance 合約中提取 所有的 ether。
// 最後 FibonacciBalance 合約的餘額為 0 ether。