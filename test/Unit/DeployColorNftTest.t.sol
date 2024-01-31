// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
// import {ColorNft} from "../src/ColorNft.sol";
import {DeployColorNft} from "../../script/DeployColorNft.s.sol";

contract DeployColorNftTest is Test {
    string public constant BLACK_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iODAwIiB3aWR0aD0iMTIwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ieE1pZFlNaWQiCiAgICB2aWV3Qm94PSItMzguMzk5ODUgLTEwNC4yMjY3NSAzMzIuNzk4NyA2MjUuMzYwNSI+CiAgICA8cGF0aCBmaWxsPSIjMzQzNDM0IiBkPSJNMTI1LjE2NiAyODUuMTY4bDIuNzk1IDIuNzkgMTI3Ljk2Mi03NS42MzhMMTI3Ljk2MSAwbC0yLjc5NSA5LjV6IiAvPgogICAgPHBhdGggZmlsbD0iIzhDOEM4QyIgZD0iTTEyNy45NjIgMjg3Ljk1OVYwTDAgMjEyLjMyeiIgLz4KICAgIDxwYXRoIGZpbGw9IiMzQzNDM0IiIGQ9Ik0xMjYuMzg2IDQxMi4zMDZsMS41NzUgNC42TDI1NiAyMzYuNTg3bC0xMjguMDM4IDc1LjYtMS41NzUgMS45MnoiIC8+CiAgICA8cGF0aCBmaWxsPSIjOEM4QzhDIiBkPSJNMCAyMzYuNTg1bDEyNy45NjIgMTgwLjMydi0xMDQuNzJ6IiAvPgogICAgPHBhdGggZmlsbD0iIzE0MTQxNCIgZD0iTTEyNy45NjEgMTU0LjE1OXYxMzMuNzk5bDEyNy45Ni03NS42Mzd6IiAvPgogICAgPHBhdGggZmlsbD0iIzM5MzkzOSIgZD0iTTEyNy45NiAxNTQuMTU5TDAgMjEyLjMybDEyNy45NiA3NS42Mzd6IiAvPgo8L3N2Zz4=";
    // Because new line character(s) are also considered when encoding.
    // Hence file needs to be read directly to generate correct encoding.
    string public svg = vm.readFile("./images/LogoBlack.svg");

    DeployColorNft public deployer;

    // ColorNft public colorNft;

    function setUp() public {
        deployer = new DeployColorNft();
        // colorNft = deployer.run();
        // string memory expectedImageURI = deployer.svgToImageURI(deployer.BLACK_SVG_URI());
    }

    function testSvgToImageURI() public {
        // string memory constant svg = vm.readFile("./images/EthLogoBlack.svg");
        string memory actualImageURI = deployer.svgToImageURI(svg);

        // actual URI
        string memory expectedImageURI = BLACK_SVG_URI;

        // Assert that the function returns the expected image URI
        assertEq(
            keccak256(abi.encodePacked(expectedImageURI)),
            keccak256(abi.encodePacked(actualImageURI))
        );
    }
}
