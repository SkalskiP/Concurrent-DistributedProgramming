%ppk.erl - Producent –> Pośrednik –> Konsument
-module(ppk).
-compile([export_all]).

consumer(Elem) ->
  io:format("This is consumer, I have received ~p ~n", [Elem]).

middleman(Elem) ->
  io:format("This is middleman, I have received ~p ~n", [Elem]),
  spawn(?MODULE, consumer, [Elem]).

sendElement(Elem) ->
  io:format("Sending = ~p ~n", [Elem]),
  spawn(?MODULE, middleman, [Elem]).

producer(N) ->
  L = [rand:uniform() || _ <- lists:seq(1, N)],
  io:format("This is producer"),
  io:format("List of created elements = ~p ~n", [L]),
  [sendElement(H) || H <- L].
