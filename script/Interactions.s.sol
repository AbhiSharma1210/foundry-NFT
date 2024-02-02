// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {ColorNft} from "../src/ColorNft.sol";

contract MintBasicNft is Script {
    string public constant SHIBA_URI =
        "ipfs://bafybeig2alno34qtpwhvgsy3zp5khirprpcxncf4udrjdnl3lf4esbaxtm";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(SHIBA_URI);
        vm.stopBroadcast();
    }
}

contract MintColorNft is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "ColorNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        ColorNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}

contract MintFlipColor is Script {
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "ColorNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        ColorNft(contractAddress).flipColor(0);
        vm.stopBroadcast();
    }
}
