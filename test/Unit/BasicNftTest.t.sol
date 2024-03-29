// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "../../lib/forge-std/src/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNft.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    address public USER = makeAddr("user");
    string public constant SHIBA =
        "ipfs://bafybeig2alno34qtpwhvgsy3zp5khirprpcxncf4udrjdnl3lf4esbaxtm/";
    string constant NFT_NAME = "Doggie";
    string constant NFT_SYMBOL = "DOG";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testInitialized_Correctly() public {
        assertEq(
            keccak256(abi.encodePacked(basicNft.name())),
            keccak256(abi.encodePacked((NFT_NAME)))
        );
        assertEq(
            keccak256(abi.encodePacked(basicNft.symbol())),
            keccak256(abi.encodePacked((NFT_SYMBOL)))
        );
    }

    function testName_is_correct() public {
        string memory expectedName = "Doggie";
        string memory actualName = basicNft.name();

        assertEq(
            keccak256(abi.encodePacked(expectedName)),
            keccak256(abi.encodePacked(actualName))
        );
    }

    function testCan_Mint_and_have_a_balance() public {
        vm.prank(USER);
        basicNft.mintNft(SHIBA);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(SHIBA)) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
