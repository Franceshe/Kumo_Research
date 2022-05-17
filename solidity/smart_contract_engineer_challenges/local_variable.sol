// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract LocalVariables {
    function localVars() external {
        uint u = 123;
        bool b = true;
    }
    
    function mul() external pure returns(uint){
        uint x = 123456;
        return x * x;
    }
}
