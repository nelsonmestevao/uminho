-module(test).
-export([run/0]).

run() ->
  Q1 = myqueue:create(),
  Q2 = myqueue:enqueue(Q1, 3),
  Q3 = myqueue:enqueue(Q2, 4),
  Q4 = myqueue:enqueue(Q3, 5),
  Q5 = myqueue:enqueue(Q4, 6),
  Q6 = myqueue:enqueue(Q5, 7),
  {Q7, 3} = myqueue:dequeue(Q6),
  {Q8, 4} = myqueue:dequeue(Q7),
  {Q9, 5} = myqueue:dequeue(Q8),
  {Q10, 6} = myqueue:dequeue(Q9),
  {Q11, 7} = myqueue:dequeue(Q10),
  ok.

