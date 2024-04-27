// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";

contract SimpleStorageTest is Test {

    SimpleStorage simpleStorage;

     function setUp() external{
         DeploySimpleStorage deployer = new DeploySimpleStorage();
         simpleStorage = deployer.run();
     }

     function testStoreAndRetrieve() public {
        uint256 number = 3;
        simpleStorage.store(number);
        uint256 expextedValue = 3;
  	    assert(expextedValue == simpleStorage.retrieve());
     }
     function testAddPerson() public {
        uint256 num = 69;
        string memory name = "Manas";
        simpleStorage.addPerson(num, name);
        assert(simpleStorage.getNameToFavNum(name) == num);
        
     }
}