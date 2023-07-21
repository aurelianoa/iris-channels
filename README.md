# Iris Channels

The `iris-channels` package is a library for creating and using channels on the Iris protocol. Channels are a way to broadcast events to a network of contracts.

## How to install

```bash
npm install @aurelianoa/iris-channels

yarn add @aurelianoa/iris-channels

pnpm add @aurelianoa/iris-channels
```

## Usage

The `iris-channels` package provides a number of functions for creating and using channels, including:

* `broadcast(address _network, string memory eventIndex, bytes memory data)`: Broadcasts an event to the specified network.
* `onReceivedMessage(address channel, string memory eventIndex)`: Called when a new message is received.
* `compareIndex(string memory a, string memory b)`: Compares two event indices.


The `iris-channels` package can be used to create a variety of applications, such as:

* A distributed chat application.
* A decentralized application that needs to broadcast events to a network of smart contracts.
* A system for tracking the progress of a distributed project.

## Example

```bash
/// @notice The MyChannel smart contract is the responsible to broadcast the events

import { Channel } from "@aurelianoa/iris-channels/contracts/channel/Channel.sol";

contract MyChannel is Channel {
  address public network;

  constructor(address _network) {
    /// Register the network address provided by the Iris protocol
    network = _network;
  }

  function foo() public {
    bytes memory data = abi.encode(var);
    string memory vas = 'someEventIndex';
    
    /// broadcast the event with the 'vas' eventIndex
    /// to the network address
    // sending empty data
    super.broadcast(network, vas, "");
  }
  
  function fooWithData(string memory var) public {
    bytes memory data = abi.encode(var);
    string memory vas = "someEventIndex";
    
    /// broadcast the event with the 'vas' eventIndex
    /// to the network address and some data
    super.broadcast(network, vas, data);
  }

}

/// @Notice MyListener Smart contract catches the event "someEventIndex" using onReceivedMessage using the helper compareIndex to catch the event.

import { Listener } from "@aurelianoa/iris-channels/contracts/listener/Listener.sol";

contract MyListener is Listener {
  function onReceivedMessage(address sender, string memory eventIndex) internal override {
        if(compareIndex(eventIndex, "someEventIndex")){
            Message memory _lastMessage = lastMessages[sender];
            string memory _result;
            (_result) = abi.decode(_lastMessage.data, (string));
            /// insert your logic here 
        }
    }
}

```

This code creates a channel called MyChannel and a listener. The listener listens for events on the channel with the event index eventIndex. When a new event is received, the listener calls the `onReceivedMessage` function, which does something with the event.

To run this code, you will need to compile it using the Solidity compiler. Once the code is compiled, you can deploy it to the Iris network.

# Imports

## Channel.sol

This contract defines a generic channel that can be used to broadcast events to a network.

## Imports

* `IChannel`: The interface that the contract implements to broadcats messages.

## Functions

* `broadcast(address _network, string memory eventIndex, bytes memory data)`: Broadcasts an event to the specified network.
* `supportsIChannelInterface(bytes4 interfaceId)`: Returns whether or not this contract supports the `IChannel` interface.


## Listener.sol

This contract implements the `IListener` interface and provides a way for listeners to listen to events on a channel.

## Imports

* `IListener`: The interface that this contract implements.

## Functions

* `listen(address channel, string memory eventIndex, bytes memory data)`: Listens to an event on the specified channel.
* `onReceivedMessage(address channel, string memory eventIndex)`: Called when a new message is received.
* `compareIndex(string memory a, string memory b)`: Compares two event indices.
* `supportsIListenerInterface(bytes4 interfaceId)`: Returns whether or not this contract supports the `IListener` interface.

## License

This code is licensed under the MIT license.

