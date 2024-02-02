// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNft} from "../../src/BasicNft.sol";
import {MintBasicNft, MintColorNft, MintFlipColor} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {
    MintBasicNft public mintBasicNft;
    MintColorNft public mintColorNft;
    MintFlipColor public mintFlipColor;

    function setUp() public {
        mintBasicNft = new MintBasicNft();
        mintColorNft = new MintColorNft();
        mintFlipColor = new MintFlipColor();
    }
}
