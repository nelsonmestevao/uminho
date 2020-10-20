-module(values).
-export([show/0]).
-record(dude, {name, age}).

println(What) -> io:format("~p~n", [What]).


show() ->


    println([2+3, 2#111, 16#ffa, 2.3e3]),


    println("Ole, ola!"),


    println(true and false),


    println(cool),


    println([1,2,3]),


    println({"Joe", 1, ok}),


    println(#{"age"=> 20}),


    println(#dude{name="Joe", age=20}),


    println([<<"ABC">>, <<001>>]),


    println(make_ref()),


    Fun = fun() -> 10 end,
    println(Fun),


    println(self()).

