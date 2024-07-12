//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NgnNft is ERC721 {
    constructor(string memory _baseURI) public ERC721(_baseURI) {
        
    }

    function mint(address owner) public {
        uint256 tokenId = totalSupply() + 1;
        _safeMint(owner, tokenId);
         _setTokenURI(tokenId, tokenURI);
    }
}
