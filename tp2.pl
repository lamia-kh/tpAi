
%1-element(X, L) is true if X is an element of the list L
% 1- element(X, L) is true if X is an element of the list L
element(X, [X|_]).
element(X, [_|T]) :-
    element(X, T).

% 2-first(E, L) is true if E is the first element of L
first(E, [E|_]).

% 3 Base case: E is the last element if L has one element
last(E, [E]).
% Recursive case: The last element is found in the tail
last(E, [_|T]) :-
    last(E, T).

%4 Base case: E is the penultimate element if L has exactly two elements
penultimate(E, [E, _]).
% Recursive case: Check the penultimate element in the tail
penultimate(E, [_|T]) :-
    penultimate(E, T).


% 5-del_k(X, L1, K, L2) is true if L2 is L1 with the Kth element removed
% and X is that element
del_k(X, [X|T], 1, T). % Base case: K = 1, remove the head
del_k(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, T, K1, R).

% 6-length(L, N) is true if N is the length of the list L
lngth([], 0).
lngth([_|T], N) :-
    length(T, N1),
    N is N1 + 1.

% 7-even(L) is true if L has an even number of elements
even(L) :-
    length(L, N),
    N mod 2 =:= 0.
% 8-concat(L1, L2, L3) is true if L3 is the result of concatenating L1
%  and L2
concat([], L, L).
concat([H|T], L, [H|R]) :-
    concat(T, L, R).
% 9- palindrome(L) is true if L is its own reversed image
palindrome(L) :-
    reverse(L, L).

% reverse helper predicate to reverse a list
reverse([], []).
reverse([H|T], R) :-
    reverse(T, RevT),
    concat(RevT, [H], R).



