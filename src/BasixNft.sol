// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@OpenZeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("Doggie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft() public {}
}
