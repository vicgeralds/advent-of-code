inRightOrder(Pages) :- safetyManualUpdate(Pages), \+ inWrongOrder(Pages). 
inWrongOrder(Pages) :- pageOrdering(X, Y), subseq(Pages, [Y, X], _), !.

middlePage(Pages, Page) :- length(Pages, Len), Index is Len // 2, nth0(Index, Pages, Page).

correctMiddlePage(Page) :- inRightOrder(Pages), middlePage(Pages, Page).

result(Sum) :-
    findall(Page, correctMiddlePage(Page), MiddlePages),
    sum_list(MiddlePages, Sum).

% Part Two

incorrectlyOrderedUpdates(SortedPages) :-
    safetyManualUpdate(Pages), inWrongOrder(Pages),
    predsort(comparePages, Pages, SortedPages).

comparePages(>, A, B) :- pageOrdering(B, A).
comparePages(<, A, B) :- \+ pageOrdering(B, A).

sortedMiddlePage(Page) :- incorrectlyOrderedUpdates(SortedPages), middlePage(SortedPages, Page).

resultPartTwo(Sum) :-
    findall(Page, sortedMiddlePage(Page), MiddlePages),
    sum_list(MiddlePages, Sum).


% run these commands in vim on puzzle input:
%
% :%s/\(\d\d*\)[|]\(\d\d*\)/pageOrdering(\1, \2)./
% :%s/^\d\d*,.*/safetyManualUpdate([\0])./

/*
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13
*/
pageOrdering(47, 53).
pageOrdering(97, 13).
pageOrdering(97, 61).
pageOrdering(97, 47).
pageOrdering(75, 29).
pageOrdering(61, 13).
pageOrdering(75, 53).
pageOrdering(29, 13).
pageOrdering(97, 29).
pageOrdering(53, 29).
pageOrdering(61, 53).
pageOrdering(97, 53).
pageOrdering(61, 29).
pageOrdering(47, 13).
pageOrdering(75, 47).
pageOrdering(97, 75).
pageOrdering(47, 61).
pageOrdering(75, 61).
pageOrdering(47, 29).
pageOrdering(75, 13).
pageOrdering(53, 13).

/*
75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
*/
safetyManualUpdate([75,47,61,53,29]).
safetyManualUpdate([97,61,53,29,13]).
safetyManualUpdate([75,29,13]).
safetyManualUpdate([75,97,47,61,53]).
safetyManualUpdate([61,13,29]).
safetyManualUpdate([97,13,75,29,47]).
