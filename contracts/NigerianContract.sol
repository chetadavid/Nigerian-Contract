//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./NgnNft.sol";
import "./NgnToken.sol";

contract NigerianContract is NgnNft, NgnToken {
    constructor(
        string memory _baseURI,
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        uint256 _totalSupply
    ) public NgnNft(_baseURI) NgnToken(_name, _symbol, _decimals, _totalSupply){
        
    } 

    mapping(address => bool) public eligibleCitizens;

    function mintAndBecomeEligible(address owner) public {
        mint(owner);
eligibleCitizens[owner] = true;
    }

    function withdrawFunds(address owner) public {
        require(eligibleCitizens[owner], "You are not eligible for funds");
        require(balanceOf(owner) == 0, "You have already withdrawn funds");

        transfer(owner, 1000); 

        eligibleCitizens[owner] = false;
    }
}
