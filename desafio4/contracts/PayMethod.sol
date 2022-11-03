// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CreateToken.sol";

contract PayMethod is CreateToken {
    uint256 amount;
    
    constructor() {
        amount = 10;
    }
    mapping(address => bool) internal contributors;
    mapping(address => uint256) private tokenGastados;

    function aprobarToken() public  {
        CreateToken.aprobarElToken(amount);
    }

    function buy(uint256 amountUser,address  otherPerson) payable public returns (bool)  {
        CreateToken.transferirElToken(otherPerson, amountUser);
        tokenGastados[msg.sender] += amountUser;
        if (tokenGastados[msg.sender] >= amount) {
            contributors[msg.sender] = true;
            return true;
        }
        return false;
    }

    function makeContributor() public {
        if (tokenGastados[msg.sender] >= amount) {
            contributors[msg.sender] = true;
        }
    }
    
}

