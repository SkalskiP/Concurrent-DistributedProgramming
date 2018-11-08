-module(list_util).
-export([len/2]).

len([]) -> 0;
len(NUMS) ->
        len(NUMS, 0).

len([H|L], Count) when H < 1 ->  %% use of guard
        len(L, Count+1);
len([_|L], Count) ->
        len(L, Count);
len([], Count) ->
        Count.
