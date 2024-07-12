//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NgnToken is ERC20 {
    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _totalSupply) public ERC20(_name, _symbol, _decimals, _totalSupply) 
}
