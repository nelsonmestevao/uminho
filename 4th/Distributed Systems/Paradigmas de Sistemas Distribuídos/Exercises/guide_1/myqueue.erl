-module(myqueue).
-export([create/0, enqueue/2, dequeue/1]).

create() -> [].

enqueue(Queue, Elem) -> Queue ++ [Elem].

dequeue([]) -> empty;
dequeue([H | T]) -> {T, H}.

