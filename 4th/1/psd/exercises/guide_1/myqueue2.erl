-module(myqueue2).
-export([create/0, enqueue/2, dequeue/1]).

create() -> {[], []}.

enqueue({[In, Out]}, Elem) -> {[Elem|In], Out}.

dequeue({In, [H|T]}) -> {{In, T}, H};
dequeue({[], []}) -> empty;
dequeue({In, []}) -> dequeue({[], lists:reverse(In)}).

