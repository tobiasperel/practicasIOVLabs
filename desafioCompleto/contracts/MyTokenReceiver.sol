// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyTokenReceiver {
    IERC20 token;
    mapping(address => bool) public isContributor;

    constructor(IERC20 _token) {
        token = _token;
    }

    function contribute() external {
        token.transferFrom(msg.sender, address(this), 10);
        isContributor[msg.sender] = true;
    }
}
