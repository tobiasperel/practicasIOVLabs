// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CreateToken is ERC20, Ownable {
    constructor() ERC20("Patito", "Pa") {}
    uint timeMint = 100;
    uint lastMint = 0;
    
    function mint(address account, uint256 amount) public {
        require(block.timestamp > lastMint + timeMint, "No se puede minar");
        lastMint = block.timestamp;
        _mint(account, amount);
    }
    function changeTimeMint(uint _timeMint) public onlyOwner {
        timeMint = _timeMint;
    }
}
