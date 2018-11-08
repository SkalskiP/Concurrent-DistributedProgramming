-module(powrot_do_liceum).
-export([pole/1]).
-export([objetosc/1]).

pole({kula, R}) ->  4 * 3.14 * math:pow(R, 2);
pole({szescian, X}) ->  math:pow(X, 2) * 6;
pole({kwadrat, X, Y}) ->  X * Y;
pole({trojkat, X, Y}) ->  0.5 * X * Y;
pole({trapez, A, B, H}) ->  0.5 * A * B * H;
pole({kolo, X}) -> 3.14 * X * X.

objetosc({kula, R}) -> 4/3 * 3.14 * math:pow(R, 3);
objetosc({szescian, X}) -> math:pow(X, 3).
