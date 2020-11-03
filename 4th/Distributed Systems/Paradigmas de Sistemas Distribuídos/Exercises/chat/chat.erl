-module(chat).

-export([main/1]).

%% Entry point
main(Port) ->
  io:format("Starting server in localhost:~p~n", [Port]),
  server:start(Port).
