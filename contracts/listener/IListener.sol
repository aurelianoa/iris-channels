// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IListener {
    function listen(address channel, string memory eventIndex, bytes memory data) external;
    function supportsIListenerInterface(bytes4 interfaceId) external view returns (bool);
} 