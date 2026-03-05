// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {UUPSv1} from "../src/UUPSv1.sol";
import {EIP1967Proxy} from "@openzeppelin/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployUUPS is Script {
    function run() external returns (address){
        address proxy = deployer();
        return proxy;
    }

    function deployer() internal returns (address) {
        vm.startBroadcast();
        UUPSv1 impl = new UUPSv1();
        EIP1967Proxy proxy = new EIP1967Proxy(address(impl), "");
        UUPSv1(address(proxy)).initialize();
        vm.stopBroadcast();
        return proxy;
    }
}