// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {SafeSendEth} from "../src/SafeSendEth.sol";

contract CounterTest is Test {
    SafeSendEth public safeSendEth;

    function setUp() public {
        safeSendEth = new SafeSendEth();
    }

    function testEquality() public view {
        console2.log(address(this) == payable(address(this)));
    }
}
