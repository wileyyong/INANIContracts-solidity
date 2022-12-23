// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.4;


import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";



contract INANI is ERC20, ERC20Burnable, Ownable, ReentrancyGuard {
    IERC20 _inani;
    constructor() ERC20("INANI", "INA") {
        _mint(msg.sender, 1000000000 * 10 ** decimals());
    }

    function transferInani(address _to, uint256 _amount) public {
        require(_amount > 0, "You need to transfer at least some tokens");
        pickInani(_to, _amount);
    }

    function pickInani(address _to, uint256 _amount) public payable nonReentrant {
        require(_amount > 0, "You need to transfer at least some tokens");
        _inani = IERC20(0xB2e408bc3E7674De7c589F4f8E5471C81F09F5c6);
        _inani.transfer(_to, _amount);
    }
}