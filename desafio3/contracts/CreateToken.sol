// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CreateToken is ERC20, Ownable {
    constructor() ERC20("Patito", "Pa") { //desafio1
        _mint(msg.sender, 100);
    }
    uint timeMinute = 100;
    uint lastMint = 0;

    function mint(address account, uint256 amount) public { 
        require(block.timestamp > lastMint + timeMinute, "No se puede minar"); //desafio2
        lastMint = block.timestamp;
        _mint(account, amount);
    }
    function mintTwoAccounts(address account1, address account2, uint256 amount) public {
        require(block.timestamp > lastMint + timeMinute, "No se puede minar");
        lastMint = block.timestamp;
        _mint(account1, amount);
        _mint(account2, amount);
    }
    function changeTimeMinute(uint _timeMinute) public onlyOwner {
        timeMinute = _timeMinute;
    }
    function seeTimeMinute() public view returns(uint) {
        return timeMinute;
    }
}
