// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IEmitter {
    function broadcast(address _channel, string memory eventIndex, bytes memory data) external;
    function supportsIEmitterInterface(bytes4 interfaceId) external view returns (bool);
}