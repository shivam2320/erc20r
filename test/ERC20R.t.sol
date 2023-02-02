// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "ds-test/test.sol";
import "forge-std/Test.sol";
import "src/ERC20R.sol";

contract ERC20RTest is Test {
    ERC20R erc20r;

    address owner = address(0x1);
    address spender = address(0x2);

    struct Recurring {
        uint256 allowedAmount;
        uint256 timePeriod;
        uint256 timeLimit;
        uint256 nextInterval;
    }

    function setUp() public {
        erc20r = new ERC20R("TEST", "TST", 18);
    }

    function testrecurringApprove() public {
        vm.startPrank(owner);
        erc20r.recurringApprove(spender, 100, 86400, 2629743);
        (
            uint256 allowedAmount,
            uint256 timePeriod,
            uint256 timeLimit,
            uint256 nextInterval
        ) = erc20r.recurringAllowance(owner, spender);
        assertEq(allowedAmount, 100);
        assertEq(timePeriod, 86400);
        assertEq(timeLimit, block.timestamp + 2629743);
        assertEq(nextInterval, block.timestamp);
    }

    function testtransferFromRecurring() public {
        vm.warp(1675335316);
        vm.startPrank(owner);
        erc20r._mint(owner, 10000);
        erc20r.recurringApprove(spender, 100, 86400, 2629743);
        vm.stopPrank();
        vm.startPrank(spender);
        (
            uint256 allowedAmount,
            uint256 timePeriod,
            uint256 timeLimit,
            uint256 nextInterval
        ) = erc20r.recurringAllowance(owner, spender);

        erc20r.transferFromRecurring(owner, address(0x3), 100);
        assertEq(erc20r.balanceOf(address(0x3)), 100);
        vm.warp(1675335316 + 86400);
        erc20r.transferFromRecurring(owner, address(0x3), 100);
    }
}
