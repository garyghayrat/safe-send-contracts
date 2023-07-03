// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract SafeSendEth {
    mapping(address sender => address receiver) public receiversList;
    mapping(address receiver => address sender) public sendersList;
    uint256 public number = 5;

    error ReceiverMismatch();
    error SenderMismatch();

    function setReceiver(address receiver) public {
        receiversList[msg.sender] = receiver;
    }

    function setSender(address sender) public {
        sendersList[msg.sender] = sender;
    }

    function sendEth(address payable receiver) public payable {
        if (receiversList[msg.sender] != receiver) revert ReceiverMismatch();
        if (sendersList[receiver] != msg.sender) revert SenderMismatch();
        (bool sent,) = receiver.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    fallback() external payable {
        revert();
    }

    receive() external payable {
        revert();
    }
}
