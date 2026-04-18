// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// This imports the official standard rules for a coin
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v5.0.0/contracts/token/ERC20/ERC20.sol";

contract ViceCoin is ERC20 {
    // When you deploy, you get 1,000,000 VICE automatically
    constructor() ERC20("Vice2 Coin", "VICE2") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    // This function allows you to send "free" VICE to any address for your demo
    function sendDemoCoins(address receiver, uint256 amount) public {
        _transfer(msg.sender, receiver, amount * 10 ** decimals());
    }
}
