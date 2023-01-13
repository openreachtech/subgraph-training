//SPDX-License-Identifier: Apache License 2.0
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BeginnerCoin is ERC20 {
    constructor() payable ERC20("BeginnerCoin", "BGC") {
        _mint(_msgSender(), 100_000 * 10**18);
    }

    function mint(address account, uint256 amount) public {
        _mint(account, amount);
    }
}
