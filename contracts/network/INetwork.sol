// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface INetwork {
    function broadcast(string memory eventIndex, bytes memory data) external;
    function setChannel(address channel, address[] memory listeners) external;
    function setChannelStatus(address channel, bool active) external;
    function setChannelLazyStatus(address channel, bool lazy) external;
    function addChannelListener(address channel, address listener) external;
    function addChannelListeners(address channel, address[] memory listeners) external;
    function removeChannelListener(address channel, address listener) external;
}