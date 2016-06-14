-module(db).
-export([
	new/0,
	destroy/1,
	write/3,
	delete/2,
	read/2,
	match/2
]).

new() -> [].

destroy(_) -> ok.

write(Key, Element, Db) -> [{Key, Element} | Db].

delete(Key, Db) -> reverse(delete_acc(Key, Db, [])).
delete_acc(_, [], Db) -> Db;
delete_acc(Key, [{Key, _} | T], Db) -> delete_acc(Key, T, Db);
delete_acc(Key, [{Key1, Value1} | T], Db) -> delete_acc(Key, T, [{Key1, Value1} | Db]).

read(_, []) -> {error, instance};
read(Key, [{Key, Value} | _]) -> {ok, Value};
read(Key, [_ | T]) -> read(Key, T).

match(Element, Db) -> reverse(match_acc(Element, Db, [])).
match_acc(_, [], Db) -> Db;
match_acc(Value, [{Key, Value} | T], Db) -> match_acc(Value, T, [Key|Db]);
match_acc(Value, [_ | T], Db) -> match_acc(Value, T, Db).

reverse([H|[]]) -> H;
reverse([H|T]) -> [reverse(T) | H].
