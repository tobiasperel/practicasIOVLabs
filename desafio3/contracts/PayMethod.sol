// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./CreateToken.sol";

contract PayMethod is CreateToken {
    uint256 amount;
    
    event Bought(uint256 amount);

    constructor() {
        amount = 10;
    }
    mapping(address => bool) internal contributors;
    mapping(address => uint256) private tokenGastados;

    function aprobarToken() public  {
        CreateToken.aprobarElToken(CreateToken.seeAddress(), amount);
    }

    function buy(uint256 amountUser) public {
        require(transferFrom(msg.sender, address(this), amountUser), "No se pudo transferir");
        tokenGastados[msg.sender] += amountUser;
        if (tokenGastados[msg.sender] >= amount) {
            contributors[msg.sender] = true;
        }
        emit Bought(amountUser);
    }
    function makeContributor() public {
        if (tokenGastados[msg.sender] >= amount) {
            contributors[msg.sender] = true;
        }
    }
    function isContributor(address _address) public view returns (bool) {
        return contributors[_address];
    }
}

