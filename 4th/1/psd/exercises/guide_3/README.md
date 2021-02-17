# Actor based chat server in Erlang

## Objectives

Implement a chat server based on the actor model, in Erlang, using a
line-oriented protocol over TCP sockets to clients.

## Tasks

1. Understand the basic chat server provided, which writes back to each
   connected client every text line that each client sends. Test the server
   using `telnet`.

2. Allow the server to have several independent chat rooms. When a client
   connects it goes to the default room. At any time a client may change room
   using some special command, e.g., `\room miei`.

3. Using the previously written login manager, add a basic authentication to
   the service, allowing clients to register username/password, and requiring
   a login before starting a chat session. The username should now be sent to
   other clients together with each text line.
