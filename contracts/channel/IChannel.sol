// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IChannel {
    function broadcast(string memory eventIndex, bytes memory data) external;
    function setChannel(address emitter, address[] memory listeners) external;
    function setChannelStatus(address emitter, bool active) external;
    function setChannelLazyStatus(address emitter, bool lazy) external;
    function setListener(address emitter, address listener) external;
    function removeChannelListener(address emitter, address listener) external;
}