// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BatchSender {
    bool public paused = true;

    constructor() {}

    function execute(IERC20 _token, address[] memory _recipients, uint256[] memory _amounts) external {
        uint256 total = 0;
        for (uint256 i = 0; i < _amounts.length; i++) {
            total += _amounts[i];
        }
        _token.transferFrom(msg.sender, address(this), total);
        require(_recipients.length == _amounts.length, "Invalid recipient and amount arrays");
        for (uint256 i = 0; i < _recipients.length; i++) {
            _token.transfer(_recipients[i], _amounts[i]);
        }
    }

    function execute2(IERC20 _token, address[] memory _recipients, uint256[] memory _amounts) external {
        require(_recipients.length == _amounts.length, "Invalid recipient and amount arrays");
        for (uint256 i = 0; i < _recipients.length; i++) {
            _token.transferFrom(msg.sender, _recipients[i], _amounts[i]);
        }
    }
}
