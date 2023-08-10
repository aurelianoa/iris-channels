// SPDX-License-Identifier: MIT
/// @title Channel
/// @author Aureliano Alarcon Smith

pragma solidity ^0.8.17;

import { IChannel } from "./IChannel.sol";
import { INetwork } from "../network/INetwork.sol";

abstract contract Channel is IChannel {

    /// @inheritdoc IChannel
    function broadcast(address _network, string memory eventIndex, bytes memory data) public {
        if(_network == address(0)) revert NotSupportedNetwork();
        INetwork network = INetwork(_network);
        network.broadcast(eventIndex, data);
    }
    /// @inheritdoc IChannel
    function supportsIChannelInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IChannel).interfaceId;
    }
}