// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ConstructorIntro {
    address public owner;
    uint public x;

    /*
    Modify the constructor. 
    It should take in an input of type uint and set the state variable x.
    */
    constructor(uint _x) {
        // Here the owner is set to the caller
        owner = msg.sender;
        
        x = _x;
    }
}
