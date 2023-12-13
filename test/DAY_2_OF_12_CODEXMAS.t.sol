// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {LW3_ChristmasSmartContract_2} from "../src/DAY_2_OF_12_CODEXMAS.sol";

contract LW3_ChristmasSmartContract_2_Test is Test {
    LW3_ChristmasSmartContract_2 public lw3_Test;

    function setUp() public {
        lw3_Test = new LW3_ChristmasSmartContract_2();
    }

    function test_getText() public {
        string memory inputText = "Hello, world!";
        string memory expectedText = "Hello, world! Merry Christmas!";

        string memory resultText = lw3_Test.getText(inputText);
        assert(keccak256(abi.encodePacked(resultText)) == keccak256(abi.encodePacked(expectedText)));
    }
}
