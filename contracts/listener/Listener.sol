// SPDX-License-Identifier: MIT
/// @title Listener
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

import { IListener } from "./IListener.sol";

abstract contract Listener is IListener {

    /// mapping of last message
    /// @dev channel => Message
    mapping(address => Message) internal lastMessages;

    /// mapping of channels
    /// @dev channel => bool
    mapping(address => bool) internal channels;

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

    /// set available channel
    /// @param channel address
    /// @param active bool
    function setChannel(address channel, bool active) public virtual {
        channels[channel] = active;
    }

    /// check if channel is available
    /// @param channel address
    /// @return bool
    function isChannelAvailable(address channel) public view virtual returns (bool) {
        return channels[channel];
    }

    /// check if message is legit
    /// @param channel address
    /// @param eventIndex string
    /// @return bool
    function isLegitMessage(address channel, string memory eventIndex) public view virtual returns (bool) {
        return isChannelAvailable(channel) && !compareIndex(lastMessages[channel].eventIndex, eventIndex);
    }
}

