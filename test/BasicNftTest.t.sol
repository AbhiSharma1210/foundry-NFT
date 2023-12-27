// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasixNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    
    funtion setUp() public() {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testName_is_correct() public view {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();
        
    }
}