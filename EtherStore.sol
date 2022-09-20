pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

//you can check this contract at the link in below
//https://rinkeby.etherscan.io/address/0xBA16F48D73A9B37Aa96201F79496D4285eff7d47
contract EtherStore{
     address immutable owner;
     uint256 public balance;

    constructor(){
        owner=msg.sender; //stores address who deployed the contract on the blockchain.
    }

    receive() external payable { //marked with "external payable" keywords to receive payments from outside.                         
        balance+=msg.value;
    }

    function withdraw(uint256 _amount , address payable _toAddress) public {
        require(msg.sender==owner,"Only owner can withdraw!"); //check msg.sender is owner
        require(balance>=_amount,"Insufficient balance!");  //check the balance
        balance-=_amount; //first the balance is reduced
        _toAddress.transfer(_amount); //and after that, we can transfer Ether.
    }
}