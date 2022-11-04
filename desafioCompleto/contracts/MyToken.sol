// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    uint lastBlockMinted = 0;
    uint public blockPeriod = 5;

    address owner;

    constructor () ERC20("My Token", "MT") {
        _mint(msg.sender, 100);
        owner = msg.sender;
    }

    function mint() external {
        require(lastBlockMinted == 0 || block.number > lastBlockMinted + blockPeriod, "Too early");
        lastBlockMinted = block.number;
        _mint(msg.sender, 10);
    }

    function changeBlockPeriod (uint newBlockPeriod) external {
        require(msg.sender == owner, "Only owner");
        blockPeriod = newBlockPeriod;
    }
}
