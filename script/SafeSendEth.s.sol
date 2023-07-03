// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {SafeSendEth} from "src/SafeSendEth.sol";

contract SafeSendEthScript is Script {
    function setUp() public {}

    function run() public returns (SafeSendEth) {
        vm.broadcast();
        SafeSendEth safeSendEth = new SafeSendEth();
        return safeSendEth;
    }
}
