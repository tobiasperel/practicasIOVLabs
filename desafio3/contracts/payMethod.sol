// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CreateToken.sol";

contract PayMethod is CreateToken {
    constructor() {}

    mapping(address => bool) private contributions;

    function makeContributor() public payable {
        require(msg.value > 10 ether, "No se puede hacer una contribucion de 0");
        contributions[msg.sender] = true;
    }
    function sayHello() public view returns (string memory) {
        require (contributions[msg.sender] == true, "No eres contribuidor");
        return "Hello World";
    }
}

