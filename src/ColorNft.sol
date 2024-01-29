// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@OpenZeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@OpenZeppelin/contracts/utils/Base64.sol";

contract ColorNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_blackSvgImageUri;
    string private s_purpleSvgImageUri;

    enum Color {
        BLACK,
        PURPLE
    }

    mapping(uint256 => Color) private s_tokenIdToColor;

    constructor(
        string memory blackSvgImageUri,
        string memory purpleSvgImageUri
    ) ERC721("Ethereum Color NFT", "EC") {
        s_tokenCounter = 0;
        s_blackSvgImageUri = blackSvgImageUri;
        s_purpleSvgImageUri = purpleSvgImageUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenIdToColor[s_tokenCounter] = Color.BLACK;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override returns (string memory) {
        return "data:application/json;base64,";
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        string memory imageURI;
        if (s_tokenIdToColor[tokenId] == Color.BLACK) {
            imageURI = s_blackSvgImageUri;
        } else {
            imageURI = s_purpleSvgImageUri;
        }

        // We can use string.concat or abi.encodePacked
        return
            string(
                abi.encodePacked(
                    _baseURI(),
                    Base64.encode(
                        bytes(
                            abi.encodePacked(
                                '{"name":"}',
                                name(),
                                '", "description": "An NFT that changes Ethereum logo color.", "attributes": [{"trait_type": "Logo size", "value": "100"}], "image": "',
                                imageURI,
                                '"}'
                            )
                        )
                    )
                )
            );
    }
}
