-module(test).
-export([
	factorial/1,
	average/1,
	sum/1,
	sum/2,
	create/1,
	reverse_create/1,
	print_numbers/1,
	filter/2
]).

% Test file %

factorial(N) when N > 0 -> 
	N * factorial(N-1);
factorial(0) -> 1.

average(List) -> 
	average_acc(List, 0,0).
average_acc([], _, Length) when Length == 0 -> 0;
average_acc([], Sum, Length) -> 
	Sum / Length;
average_acc([H | T], Sum, Length) -> 
	average_acc(T, Sum + H, Length + 1).

sum(N) when N > 0 ->
	N + sum(N-1);
sum(_) -> {error, "Insert a positive number"}.

sum(N,M) -> sum_acc(N,M,0).
sum_acc(N,M,Sum) when N =< M ->
		sum_acc(N+1,M,N+Sum);
sum_acc(_,_,Sum) -> Sum.

create(N) -> lists:reverse(create_acc([],1,N)).
reverse_create(N) -> create_acc([],1,N).
create_acc(List, Index, Max) when Index =< Max ->
	create_acc([Index|List], Index+1, Max);
create_acc(List,_,_) -> List.

print_numbers(N) -> print_acc(1,N).
print_acc(Index, Max) when Index =< Max ->
	io:format("Number: ~p~n", [Index]),
	print_acc(Index+1, Max);
print_acc(_,_) -> 0.


filter(List, N) -> filter_acc(List, N, []).
filter_acc([H|T], N, List) when H =< N -> [H | filter_acc(T,N,List)];
filter_acc(_, _, List) -> List.

