// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ColorNft} from "../src/ColorNft.sol";
import {Base64} from "@OpenZeppelin/contracts/utils/Base64.sol";

contract DeployColorNft is Script {
    uint256 public DEFAULT_ANVIL_PRIVATE_KEY =
        0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;

    string public constant BLACK_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iODAwIiB3aWR0aD0iMTIwMCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ieE1pZFlNaWQiCiAgICB2aWV3Qm94PSItMzguMzk5ODUgLTEwNC4yMjY3NSAzMzIuNzk4NyA2MjUuMzYwNSI+CiAgICA8cGF0aCBmaWxsPSIjMzQzNDM0IiBkPSJNMTI1LjE2NiAyODUuMTY4bDIuNzk1IDIuNzkgMTI3Ljk2Mi03NS42MzhMMTI3Ljk2MSAwbC0yLjc5NSA5LjV6IiAvPgogICAgPHBhdGggZmlsbD0iIzhDOEM4QyIgZD0iTTEyNy45NjIgMjg3Ljk1OVYwTDAgMjEyLjMyeiIgLz4KICAgIDxwYXRoIGZpbGw9IiMzQzNDM0IiIGQ9Ik0xMjYuMzg2IDQxMi4zMDZsMS41NzUgNC42TDI1NiAyMzYuNTg3bC0xMjguMDM4IDc1LjYtMS41NzUgMS45MnoiIC8+CiAgICA8cGF0aCBmaWxsPSIjOEM4QzhDIiBkPSJNMCAyMzYuNTg1bDEyNy45NjIgMTgwLjMydi0xMDQuNzJ6IiAvPgogICAgPHBhdGggZmlsbD0iIzE0MTQxNCIgZD0iTTEyNy45NjEgMTU0LjE1OXYxMzMuNzk5bDEyNy45Ni03NS42Mzd6IiAvPgogICAgPHBhdGggZmlsbD0iIzM5MzkzOSIgZD0iTTEyNy45NiAxNTQuMTU5TDAgMjEyLjMybDEyNy45NiA3NS42Mzd6IiAvPgo8L3N2Zz4=";
    string public constant PURPLE_SVG_URI =
        "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGhlaWdodD0iODAwIiB3aWR0aD0iMTIwMCIgdmlld0JveD0iLTE2MS45NyAtNDM5LjY1IDE0MDMuNzQgMjYzNy45Ij4KICAgIDxwYXRoIGZpbGw9IiM4QTkyQjIiIGQ9Ik01MzkuNyA2NTAuM1YwTDAgODk1LjZ6IiAvPgogICAgPHBhdGggZmlsbD0iIzYyNjg4RiIgZD0iTTUzOS43IDEyMTQuN1Y2NTAuM0wwIDg5NS42em0wLTU2NC40bDUzOS44IDI0NS4zTDUzOS43IDB6IiAvPgogICAgPHBhdGggZmlsbD0iIzQ1NEE3NSIgZD0iTTUzOS43IDY1MC4zdjU2NC40bDUzOS44LTMxOS4xeiIgLz4KICAgIDxwYXRoIGZpbGw9IiM4QTkyQjIiIGQ9Ik01MzkuNyAxMzE2LjlMMCA5OThsNTM5LjcgNzYwLjZ6IiAvPgogICAgPHBhdGggZmlsbD0iIzYyNjg4RiIgZD0iTTEwNzkuOCA5OThsLTU0MC4xIDMxOC45djQ0MS43eiIgLz4KPC9zdmc+";

    function run() external returns (ColorNft) {
        vm.startBroadcast();
        ColorNft colorNft = new ColorNft(BLACK_SVG_URI, PURPLE_SVG_URI);
        vm.stopBroadcast();
        return colorNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string.concat(baseURL, svgBase64Encoded);
    }
}
