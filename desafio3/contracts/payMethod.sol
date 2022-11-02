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
    }

    mapping(address => bool) private contributors;

    function makeContributor() public payable {
        require(msg.value > 10 ether, "No se puede hacer una contribucion de 0");
        contributors[msg.sender] = true;
    }
    function buy() public payable {
        uint256 amountTobuy = msg.value;
        require(amountTobuy == 7 ether, "No se puede comprar");
        uint256 dexBalance = balanceOf(address(this));
        require(amountTobuy > 0, "Debe comprar al menos 1 token");
        require(amountTobuy <= dexBalance, "No hay suficientes fichas en la reserva");
        //ficha.transfer(msg.sender, amountTobuy);
        //emit Bought(amountTobuy);
    } 
}

