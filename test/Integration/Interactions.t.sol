// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {MintBasicNft} from "../../script/Interactions.s.sol";
import {DevOpsTools} from "../../lib/foundry-devops/src/DevOpsTools.sol";

contract BasicNftTest is Test {
    MintBasicNft public mintScript;

    function setUp() public {
        mintScript = new MintBasicNft();
    }

    function testMintBasicNft() public {
        mintScript.run();

        // Get the most recently deployed BasicNft contract address
        address basicNftAddress = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        BasicNft basicNft = BasicNft(basicNftAddress);

        // Perform assertions based on your minting logic
        // For example, check if the token URI is set correctly
        string memory tokenURI = basicNft.tokenURI(0);
        assertEq(
            tokenURI,
            "ipfs://bafybeig2alno34qtpwhvgsy3zp5khirprpcxncf4udrjdnl3lf4esbaxtm/"
        );
    }
}
