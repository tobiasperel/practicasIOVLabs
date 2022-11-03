// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

//import "./PayMethod.sol";

contract Contribuidores is ERC721, Ownable {
    uint tokenId;

    constructor() ERC721("Roger Federer", "RF") {
        tokenId = 0;
    }

    mapping (address => bool) internal contributors;

    function isContributor(address _address) public view returns (bool) {
        return contributors[_address];
    }
    
    function makeNFT() public onlyOwner {
        require(isContributor(msg.sender), "No eres contribuidor");
        _safeMint(msg.sender, tokenId);
        tokenId++;
    }
}