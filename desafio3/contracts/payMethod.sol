// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CreateToken.sol";

contract PayMethod is CreateToken {
    uint amount;

    constructor() {
        amount = 10;
    }

    mapping(address => bool) private contributors;

    function makeContributor() public payable {
        require(msg.value > 10 ether, "No se puede hacer una contribucion de 0");
        contributors[msg.sender] = true;
    }
    function buy() public {
        require(CreateToken.transferFrom(msg.sender, this, amount));

    }
}

