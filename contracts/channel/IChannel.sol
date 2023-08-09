// SPDX-License-Identifier: MIT
/// @title IChannel
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

interface IChannel {
    /// errors
    error NotSupportedNetwork();
    /// broadcast message to network
    /// @param _network address
    /// @param eventIndex string
    /// @param data bytes
    function broadcast(address _network, string calldata eventIndex, bytes calldata data) external;
    /// supports IChannel interface
    /// @param interfaceId bytes4
    /// @return bool
    function supportsIChannelInterface(bytes4 interfaceId) external view returns (bool);
}