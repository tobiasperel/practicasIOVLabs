// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import CreateToken.sol;
contract payMethod is CreateToken {
    function makeContributor() public payable {
        require(msg.value > 0, "No se puede hacer una contribucion de 0");
        uint256 amount = msg.value * 100;
        mint(msg.sender, amount);
    }
}