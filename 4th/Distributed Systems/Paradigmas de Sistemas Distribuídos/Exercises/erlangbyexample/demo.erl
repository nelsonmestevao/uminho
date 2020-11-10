-module(demo).
-export([factorial/1]).

factorial(0) -> 1;
factorial(N) when N >= 1 -> N * factorial(N-1).

