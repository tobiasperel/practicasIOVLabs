// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CreateToken is ERC20, Ownable {
    constructor() ERC20("Patito", "Pa") {}
    uint timeMint = 100;
    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }
    
}
