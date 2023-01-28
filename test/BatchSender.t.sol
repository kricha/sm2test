// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

import "forge-std/Test.sol";
import "../src/BatchSender.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BatchSenderTest is Test {
    BatchSender public batch_sender;
    IERC20 usdt = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    IERC20 usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);

    address rec1 = vm.addr(0x1);
    address rec2 = vm.addr(0x2);
    address rec3 = vm.addr(0x3);

    function setUp() public {
        batch_sender = new BatchSender();
        vm.startPrank(0x5754284f345afc66a98fbB0a0Afe71e0F007B949);
        usdt.transfer(rec1, 1000 * 10 ** 6);
        usdt.transfer(rec2, 10000 * 10 ** 6);
        // usdt.transfer(rec3, 100000 * 10 ** 6);
        vm.stopPrank();

        // vm.startPrank('');
        // usdc.transfer(rec1, 1000 * 10 ** 6);
        // usdc.transfer(rec2, 10000 * 10 ** 6);
        // // usdt.transfer(rec3, 100000 * 10 ** 6);
        // vm.stopPrank();
    }

    function testPaused() public {
        assertEq(batch_sender.paused(), true);
    }
}
