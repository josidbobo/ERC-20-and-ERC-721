// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MaaziCoin is ERC20, Ownable {
    constructor() ERC20("MaaziCoin", "MCN") {
        _mint(msg.sender, 1000000 * 10 ** 18);
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) external payable {
        require(msg.value > 0, "You cannot mint MCN with zero ETH");

        uint256 amount = msg.value * 1000 / 10 ** decimals();
        _mint(receiver, amount);
    }
}