# Solidity developer roadmap


##  Solidity by example

### Key words:
* functions:
** external: this function can only be called from outside of this contract 
** pure:     this function does not write anything to the blockchain
* variables:
** state variable
    stable variable: stored on blockchain, So you can save some data into a state variable, come back a week later and the data will still be there.

** local variable
... Unlike state variables, local variables are not stored on the blockchain.
... Local variables are declared inside functions.
... Any data assigned to a local variable will be lost after the function finishes execution.

** global variable: provide information abou the blockchain

* View and Pure Functions
.. Functions that do not write anything to blockchain can be declared as "view" or "pure".
** What's the difference between view and pure?
.. view functions can read state and global variables.
.. pure functions cannot read neither state nor global variables.

* default value:
"""
Local and state variables have default values.

Here are the default values for data types that we have covered so far.

type	default value
int	0
uint	0
bool	false
address	0x0000000000000000000000000000000000000000
bytes32	0x0000000000000000000000000000000000000000000000000000000000000000
"""

* Constants:
... State variables can be declared as constant. Value of constant variables must be set before compilation and it cannot be modified after the contract is compiled.
... Why use constants?
Compared to state variables, constant variables use less gas.

Style guide
Following convention, constants should be named with all capital letters with underscore separating words.

THIS_IS_MY_CONSTANT_VAR

* Tenary operator:
y = x > 1 ? 10 : 20;

* Error Handling
"""
Solidity has 3 ways to throw an error, require, revert and assert.

require is used to validate inputs and check conditions before and after execution.
revert is like require but more handy when the condition to check is nested in several if statements.
assert is used to check invariants, code that should never be false. Failing assertion probably means that there is a bug.
An error will undo all changes made during a transaction.
"""



* Function modifier: allow you to reuse code
"""
Function modifiers are reuseable code that can be run before and / or after a function call.

Here are some examples of how they are used.

Restrict access
Validate inputs
Check states right before and after a function call
"""


* Constructor
"""
constructor is a special function that is called only once when the contract is deployed.
The main purpose of the the constructor is to set state variables to some initial state.
"""
