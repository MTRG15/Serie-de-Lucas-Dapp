// to compile and interact with this contract, I used the web browser based IDE Remix, 
// connected to an Injected Web3 provider from the Chrome plug in Metamask
// In turn, Metamask was connected to my localhost network created by 
// Ganache GUI, which created and administered the descentralized distributed system based on the
// Ethereum blockchain 


// Created by 
// Marco Ramírez
// CI: 24148570

// Explanation of this code available in 
// https://youtu.be/RvgqIOVtLIA
pragma solidity ^0.8.0;
// SPDX-License-Identifier: UNLICENSED
contract SerieLucas {
    // Declaring variables
    uint public current = 1;
    uint public previous = 2;
    uint buffer;
    bytes32 strbuffer;
    
    // calculates the next number in the series
    function increase() public{
        buffer = current;
        current = current + previous;
        previous = buffer;
    }
    
    // display the values of  the variables
    function retrieve_current() public view returns(string memory){
        return uintToString(current);
    }
    
    function retrieve_previous() public view returns(string memory){
        return uintToString(previous);
    }
    
    // return the values for the current and previous values
    function uintToString(uint v) public pure returns (string memory) {
    uint maxlength = 100;
    bytes memory reversed = new bytes(maxlength);
    uint i = 0;
    while (v != 0) {
        uint remainder = v % 10;
        v = v / 10;
        reversed[i++] = bytes1(uint8(48 + remainder));
    }
    bytes memory s = new bytes(i); // i + 1 is inefficient
    for (uint j = 0; j < i; j++) {
        s[j] = reversed[i - j - 1]; // to avoid the off-by-one error
    }
    string memory str = string(s);  // memory isn't implicitly convertible to storage
    return str;
    }
    
    
}