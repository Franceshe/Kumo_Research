// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Counter {
    // Write your code here
    //Solidity automatically creates an external view function for the state variable count.
    
    //Declare a public state variable named count of type uint.
    uint public count;
    
    //increment the counter
    //modify the function not view nor pure
    function inc() external{
        count += 1;
    }

    //decrement the counter
    function dec()external{
        count -= 1;
    }

}
