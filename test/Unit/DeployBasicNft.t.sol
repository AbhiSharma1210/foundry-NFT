// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract TestDeployBasicNft is Test {
    DeployBasicNft public deployBasicNft;
    BasicNft basicNft;

    function setUp() public {
        deployBasicNft = new DeployBasicNft();
    }

    function testDeployBasicNft() public {
        basicNft = deployBasicNft.run();
        assertTrue(address(basicNft) != address(0x0), "Deployment Failed!");
    }
}
