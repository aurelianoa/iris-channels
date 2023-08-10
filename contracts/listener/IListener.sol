// SPDX-License-Identifier: MIT
/// @title IListener
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

interface IListener {
    ///structs
    struct Message {
        string eventIndex;
        bytes data;
    }
    /// listen to channels message
    /// @param channel address
    /// @param eventIndex string
    /// @param data bytes
    function listen(address channel, string memory eventIndex, bytes memory data) external;
    /// supports IListener interface
    /// @param interfaceId bytes4
    /// @return bool
    function supportsIListenerInterface(bytes4 interfaceId) external view returns (bool);
} 