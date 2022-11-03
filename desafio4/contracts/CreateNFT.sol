// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract CreateNFT is ERC721 {
    uint256 public tokenId;
    mapping (address => bool) private seLeDioElNFT;

    constructor() ERC721("Gabriel Stacanelli", "GT") {
        tokenId = 1;
    }
    function makeNFT(bool esContribuidro) public  {
        require (esContribuidro == true, "No es contribuidor");
        _safeMint(msg.sender, tokenId);
        tokenId++;
    }
    
}