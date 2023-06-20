// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import { IEmitter } from "./IEmitter.sol";
import { IChannel } from "../channel/IChannel.sol";

abstract contract Emitter is IEmitter {

    function broadcast(address _channel, string memory eventIndex, bytes memory data) public {
        require(_channel != address(0), "not supported channel");
        IChannel channel = IChannel(_channel);
        channel.broadcast(eventIndex, data);
    }

    function supportsIEmitterInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IEmitter).interfaceId;
    }
}