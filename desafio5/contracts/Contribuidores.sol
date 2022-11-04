// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./PayMethod.sol";
import "./CreateNFT.sol";
contract  Contribuidores is PayMethod, CreateNFT {
    uint256 tokenId;
    
    constructor() {
        tokenId = 0;
    }

    function isContributor(address _address) external view returns (bool){
        contributors[_address];
    }
    function crearNFT() external override {
        require(contributors[msg.sender], "No eres contribuidor");
        _mint(msg.sender, 1);
        tokenId++;
    }
}

