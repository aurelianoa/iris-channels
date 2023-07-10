// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import { IChannel } from "./IChannel.sol";
import { INetwork } from "../network/INetwork.sol";

abstract contract Channel is IChannel {

    function broadcast(address _network, string memory eventIndex, bytes memory data) public {
        require(_network != address(0), "not supported network");
        INetwork network = INetwork(_network);
        network.broadcast(eventIndex, data);
    }

    function supportsIChannelInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IChannel).interfaceId;
    }
}