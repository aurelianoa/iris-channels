// SPDX-License-Identifier: MIT
/// @title INetwork
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

interface INetwork {
    /// broadcast message to listeners
    /// @param eventIndex string
    /// @param data bytes
    function broadcast(string memory eventIndex, bytes memory data) external;
    /// Set channel and listeners
    /// @param channel address
    /// @param listeners address[]
    function setChannel(address channel, address[] memory listeners) external;
    /// Set channel status
    /// @param channel address
    /// @param active bool
    function setChannelStatus(address channel, bool active) external;
    /// Set channel lazy status
    /// @param channel address
    /// @param lazy bool
    function setChannelLazyStatus(address channel, bool lazy) external;
    /// Add channel listener
    /// @param channel address
    /// @param listener address
    function addChannelListener(address channel, address listener) external;
    /// Add channel listeners
    /// @param channel address
    /// @param listeners address[]
    function addChannelListeners(address channel, address[] memory listeners) external;
    /// Remove channel listener
    /// @param channel address
    /// @param listener address
    function removeChannelListener(address channel, address listener) external;
}