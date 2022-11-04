// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./Contribuidores.sol";

interface CreateNFT is IERC721 {
    function crearNFT(address _address) external;
}