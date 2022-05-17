// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//state variables
//global variables
//funciton modifier
//function
//error hanling

/*A simple contract which claims ownership*/

//Create a contract that has an owner and only the owner can assign a new owner.
contract Ownable {
    address public owner;
    
    //intialize owner
    constructor(){
        owner = msg.sender;
    }
    
    // create function modifer where only owner can assign
    modifier onlyOwner(){
        if (msg.sender != owner){
            revert("not owner");
        }
        _;
    }
    
    
    function setOwner(address _newOwner) external onlyOwner {
        if(_newOwner == address(0)){
            revert("new owner = zero address");
        }    
        owner = _newOwner;
    }
}
