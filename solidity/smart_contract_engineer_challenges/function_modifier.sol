// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

//function modifier basic
//function modifier with input
//function modifier with sandwich

contract FunctionModifier {
    bool public paused;
    uint public count;

    // Modifire to check if not paused
    modifier whenNotPaused() {
        require(!paused, "paused");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function setPause(bool _paused) external {
        paused = _paused;
    }

    // This function will throw an error if paused
    function inc() external whenNotPaused {
        count += 1;
    }
    
    /*Task1:
    Add the modifier whenNotPaused to dec() so that 
    count can only be decreased if paused is false.
    */
    function dec() external whenNotPaused{
        count -= 1;
        
    }
    
    
    /*Task2:
    Create a modifier named whenPaused, which checks that 
    the state variable pause is true.
    It should throw an error message "not paused" if paused 
    is false.
    */
    modifier whenPaused(){
        if(!paused){
            revert("not paused");
        }
        // execute the rest of the code.
        _;
    }
    
    
    // Modifiers can take inputs.
    // Here is an example to check that x is < 10
    modifier cap(uint _x) {
        require(_x < 10, "x >= 10");
        _;
    }

    function incBy(uint _x) external whenNotPaused cap(_x) {
        count += _x;
    }

    // Modifiers can execute code before and after the function.
    modifier sandwich() {
        // code here
        _;
        // more code here
    }
    
    //Task3:
    function reset() external whenPaused {
        count = 0;
    }
    
}
