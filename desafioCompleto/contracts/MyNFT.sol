// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./MyTokenReceiver.sol";

contract MyNFT is ERC721 {
    MyTokenReceiver tokenReceiver;
    uint tokenId = 0;

    constructor(MyTokenReceiver _tokenReceiver) ERC721("My NFT", "MNT") {
        tokenReceiver = _tokenReceiver;
    }

    function mint() external {
        require(tokenReceiver.isContributor(msg.sender), "Not contributor");
        _mint(msg.sender, tokenId++);
    }
}
