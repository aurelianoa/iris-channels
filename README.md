# Iris Channels

The `iris-channels` package is a library for creating and using channels on the Iris network. Channels are a way to broadcast events to a network of contracts.

## How to install

```bash
npm install @aurelianoa/iris-channels

yarn add @aurelianoa/iris-channels

pnpm add @aurelianoa/iris-channels
```

## Usage

The `iris-channels` package provides a number of functions for creating and using channels, including:

* `broadcast(address _network, string memory eventIndex, bytes memory data)`: Broadcasts an event to the specified network.
* `supportsIChannelInterface(bytes4 interfaceId)`: Returns whether or not a contract supports the `IChannel` interface.
* `listen(address channel, string memory eventIndex, bytes memory data)`: Listens to an event on the specified channel.
* `onReceivedMessage(address channel, string memory eventIndex)`: Called when a new message is received.
* `compareIndex(string memory a, string memory b)`: Compares two event indices.
* `supportsIListenerInterface(bytes4 interfaceId)`: Returns whether or not a contract supports the `IListener` interface.

The `iris-channels` package can be used to create a variety of applications, such as:

* A distributed chat application.
* A decentralized application that needs to broadcast events to a network of users.
* A system for tracking the progress of a distributed project.

## Example

```bash
contract Channel {
  string public name;

  constructor(string memory _name) {
    name = _name;
  }

  function broadcast(string memory eventIndex, bytes memory data) public {
    emit Broadcast(eventIndex, data);
  }
}

contract Listener {
  event ReceivedMessage(address indexed channel, string indexed eventIndex);

  function listen(Channel _channel, string memory eventIndex) public {
    _channel.onReceivedMessage(
      address(this),
      eventIndex,
      abi.encodePacked("Received message on ", eventIndex)
    );
  }
}

contract Example {
  Channel channel = new Channel("my-channel");
  Listener listener = new Listener();

  function onReceivedMessage(address channel, string memory eventIndex) public {
    // Do something with the event
  }

  function start() public {
    listener.listen(channel, "event-index");
  }
}
```

This code creates a channel called my-channel and a listener. The listener listens for events on the channel with the event index event-index. When a new event is received, the listener calls the onReceivedMessage function, which does something with the event.

To run this code, you will need to compile it using the Solidity compiler. Once the code is compiled, you can deploy it to the Iris network.


## Channel.sol

This contract defines a generic channel that can be used to broadcast events to a network.

## Imports

* `IChannel`: The interface that this contract implements.
* `INetwork`: The interface that represents a network.

## Functions

* `broadcast(address _network, string memory eventIndex, bytes memory data)`: Broadcasts an event to the specified network.
* `supportsIChannelInterface(bytes4 interfaceId)`: Returns whether or not this contract supports the `IChannel` interface.

## License

This code is licensed under the MIT license.

---

# IChannel.sol

## IChannel.sol

This interface defines the methods that a channel must implement in order to be able to broadcast events to a network.

## Functions

* `broadcast(address _channel, string memory eventIndex, bytes memory data)`: Broadcasts an event to the specified channel.
* `supportsIChannelInterface(bytes4 interfaceId)`: Returns whether or not this contract supports the `IChannel` interface.

## License

This code is licensed under the MIT license.




# IListener.sol

## IListener.sol

This interface defines the methods that a listener must implement in order to be able to listen to events on a channel.

## Functions

* `listen(address channel, string memory eventIndex, bytes memory data)`: Listens to an event on the specified channel.
* `supportsIListenerInterface(bytes4 interfaceId)`: Returns whether or not this contract supports the `IListener` interface.

## License

This code is licensed under the MIT license.

---

# Listener.sol

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

