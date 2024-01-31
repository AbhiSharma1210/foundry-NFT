// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {ColorNft} from "../src/ColorNft.sol";
import {Base64} from "@OpenZeppelin/contracts/utils/Base64.sol";

contract DeployColorNft is Script {
    function run() external returns (ColorNft) {
        // vm.readFile is only available in Foundry.
        string memory blackLogoSVG = vm.readFile("./images/LogoBlack.svg");
        string memory purpleLogoSVG = vm.readFile("./images/LogoPurple.svg");

        vm.startBroadcast();
        ColorNft colorNft = new ColorNft(
            svgToImageURI(blackLogoSVG),
            svgToImageURI(purpleLogoSVG)
        );
        vm.stopBroadcast();
        return colorNft;
    }

    // Below function will take in the svg file content and convert it to image URI.
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
