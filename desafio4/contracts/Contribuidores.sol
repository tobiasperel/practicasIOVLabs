// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./PayMethod.sol";
contract Contribuidores is PayMethod {

    function isContributor(address _address) public view returns (bool) {
        return contributors[_address];
    }

}