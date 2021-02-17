-module(chat).

-export([main/1]).

%% Entry point
main(Args) ->
  {ok, Port} = get_port(Args),
  io:format("Starting server at localhost:~p~n", [Port]),
  server:start(Port), ok.

%% Internal functions

get_port(Args) ->
  io:format("(debug) Args: ~p~n", [Args]),
  [H | _] = Args,
  {Port, _} = string:to_integer(H),
  {ok, Port}.
  % {error, "Missing $PORT argument"}.
