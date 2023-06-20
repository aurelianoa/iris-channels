// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import { IListener } from "./IListener.sol";

abstract contract Listener is IListener {

    struct Message {
        string eventIndex;
        bytes data;
    }
    
    mapping(address => Message) internal lastMessages;

    function listen(address sender, string memory eventIndex, bytes memory data) virtual public {
        Message memory _message = Message(eventIndex, data);
        lastMessages[sender] = _message;
        onReceivedMessage(sender, eventIndex);
    }

    function onReceivedMessage(address sender, string memory eventIndex) virtual internal {}
    
    function compareIndex(string memory a, string memory b) public pure returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }

    function supportsIListenerInterface(bytes4 interfaceId) public view virtual returns (bool) {
        return interfaceId == type(IListener).interfaceId;
    }
}

