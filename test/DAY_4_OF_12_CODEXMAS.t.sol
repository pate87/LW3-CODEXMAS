// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {LW3_ChristmasSmartContract_3} from "../src/DAY_3_OF_12_CODEXMAS.sol";

contract LW3_ChristmasSmartContract_3_Test is Test {
    LW3_ChristmasSmartContract_3 public lw3_Test;

    function setUp() public {
        lw3_Test = new LW3_ChristmasSmartContract_3();
    }

    function test_addNumber() public view {
        uint a = 2;
        uint b = 8;

        uint testCalc = lw3_Test.addNumber(a,b);
        uint exptectedNumber = 10; 
        assert(testCalc == exptectedNumber);
    }
}