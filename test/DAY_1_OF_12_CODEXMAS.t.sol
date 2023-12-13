// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {LW3_ChristmasSmartContract_1} from "../src/DAY_1_OF_12_CODEXMAS.sol";

contract LW3_ChristmasSmartContract_1_Test is Test {
    LW3_ChristmasSmartContract_1 public lw3_Test;

    function setUp() public {
        lw3_Test = new LW3_ChristmasSmartContract_1();
    }

    function test_getText() public {
        string memory resultText = lw3_Test.getText();
        assertEq(resultText, "Ho, Ho, Ho, Merry Christmas!");
    }
}
