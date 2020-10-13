# Chat
> Foundations of Distributed Systems
> Lab Guide 1 - 2020/21

Consider a simple multi-threaded chat server using Java and sockets, where lines
sent by any client are broadcast to all currently connected clients.

## Steps

1. Implement the server using the simplest strategy possible.
2. Implement an interactive client.
3. Implement a non-interactive client to generate load (bot) that sleeps a
   configurable amount of time between sending or receiving messages.
4. Run clients with different delay configurations

## Questions

1. How does one client affect other clients?
2. How do clients affect server memory usage as observed with jconsole?

## Learning Outcomes

Recall basic distributed systems programming with Java, sockets and threads.
Relate inter-active performance and memory usage with server programming.

