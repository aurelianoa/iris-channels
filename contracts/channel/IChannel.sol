// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IChannel {
    function broadcast(address _channel, string memory eventIndex, bytes memory data) external;
    function supportsIChannelInterface(bytes4 interfaceId) external view returns (bool);
}