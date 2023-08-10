// SPDX-License-Identifier: MIT
/// @title Listener
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

import { IListener } from "./IListener.sol";

abstract contract Listener is IListener {

    /// mapping of last message
    /// @dev channel => Message
    mapping(address => Message) internal lastMessages;

    /// @inheritdoc IListener
    function listen(address channel, string memory eventIndex, bytes memory data) virtual public {
        Message memory _message = Message(eventIndex, data);
        lastMessages[channel] = _message;
        onReceivedMessage(channel, eventIndex, data);
    }

    /// virtual function to be overriden by the child contract
    /// @param channel address
    /// @param eventIndex string
    function onReceivedMessage(address channel, string memory eventIndex, bytes memory data) virtual internal {}
    
    /// compare two strings
    /// @param a string
    /// @param b string
    /// @return bool
    function compareIndex(string memory a, string memory b) public pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    /// @inheritdoc IListener
    function supportsIListenerInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IListener).interfaceId;
    }
}

