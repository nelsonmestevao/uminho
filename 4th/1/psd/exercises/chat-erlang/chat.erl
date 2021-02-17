-module(chat).
-export([start_server/1]).

start_server(Port) ->
  {ok, LSock} = gen_tcp:listen(Port, [binary, {packet, line}, {reuseaddr, true}]),
  Room = spawn(fun()-> room([]) end),
  spawn(fun() -> acceptor(LSock, Room) end),
  ok.

acceptor(LSock, Room) ->
  {ok, Sock} = gen_tcp:accept(LSock),
  Room ! {new_user, Sock},
  gen_tcp:controlling_process(Sock, Room),
  acceptor(LSock, Room).

room(Sockets) ->
  receive
    {new_user, Sock} ->
      io:format("new user~n", []),
      room([Sock | Sockets]);
    {tcp, _, Data} ->
      io:format("received ~p~n", [Data]),
      [gen_tcp:send(Socket, Data) || Socket <- Sockets],
      room(Sockets);
    {tcp_closed, Sock} ->
      io:format("user disconnected~n", []),
      room(Sockets -- [Sock]);
    {tcp_error, Sock, _} ->
      io:format("tcp error~n", []),
      room(Sockets -- [Sock])
  end.

