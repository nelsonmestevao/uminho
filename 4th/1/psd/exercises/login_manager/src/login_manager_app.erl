%%%-------------------------------------------------------------------
%% @doc login_manager public API
%% @end
%%%-------------------------------------------------------------------

-module(login_manager_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    login_manager_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
