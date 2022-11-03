// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CreateToken.sol";

contract PayMethod is CreateToken {
    uint amount;
    
    event Bought(uint256 amount);

    constructor() {
        amount = 10;
        token = new ERC20("Token", "TKN");
    }
    function buy() public payable {
        require(msg.value >= amount, "Not enough ether");
        token.mint(msg.sender, 1);
        emit Bought(1);
    }
    mapping(address => bool) private contributors;
    mapping(address => uint256) private balances;

    function makeContributor() public payable {
        require(msg.value > 10 ether, "No se puede hacer una contribucion de 0");
        contributors[msg.sender] = true;
    }
    
}

