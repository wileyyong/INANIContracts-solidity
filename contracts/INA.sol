// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract INA is ERC20 {
    constructor(uint _totalSupply) ERC20("INANI", "INA") public {
        _mint(msg.sender, _totalSupply);
    }
}