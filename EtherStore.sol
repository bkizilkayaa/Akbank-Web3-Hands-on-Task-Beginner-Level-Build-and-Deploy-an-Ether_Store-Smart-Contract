pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

//you can check this contract at the link in below
//https://rinkeby.etherscan.io/address/0xBA16F48D73A9B37Aa96201F79496D4285eff7d47
contract EtherStore{
     address immutable owner;
     uint256 public balance;
    constructor(){
        owner=msg.sender;
    }

    receive() external payable {
        balance+=msg.value;
    }

    function withdraw(uint256 _amount , address payable _toAddress) public {
        require(msg.sender==owner,"Only owner can withdraw!");
        require(balance>=_amount,"Insufficient balance!");
        balance-=_amount;
        _toAddress.transfer(_amount);
    }
}