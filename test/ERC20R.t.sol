// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.7;

import "ds-test/test.sol";
import "forge-std/Test.sol";
import "src/ERC20R.sol";

contract ERC20RTest is Test {
    ERC20R erc20r;

    function setup() public {
        erc20r = new ERC20R("TEST", "TST", 18);
    }
}
