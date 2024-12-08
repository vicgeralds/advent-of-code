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

pageOrdering(96, 56).
pageOrdering(68, 78).
pageOrdering(68, 96).
pageOrdering(52, 85).
pageOrdering(52, 14).
pageOrdering(52, 76).
pageOrdering(85, 18).
pageOrdering(85, 96).
pageOrdering(85, 13).
pageOrdering(85, 75).
pageOrdering(64, 15).
pageOrdering(64, 75).
pageOrdering(64, 16).
pageOrdering(64, 41).
pageOrdering(64, 49).
pageOrdering(49, 22).
pageOrdering(49, 88).
pageOrdering(49, 56).
pageOrdering(49, 67).
pageOrdering(49, 86).
pageOrdering(49, 78).
pageOrdering(88, 56).
pageOrdering(88, 16).
pageOrdering(88, 29).
pageOrdering(88, 22).
pageOrdering(88, 18).
pageOrdering(88, 41).
pageOrdering(88, 87).
pageOrdering(33, 17).
pageOrdering(33, 14).
pageOrdering(33, 95).
pageOrdering(33, 13).
pageOrdering(33, 85).
pageOrdering(33, 53).
pageOrdering(33, 57).
pageOrdering(33, 39).
pageOrdering(83, 47).
pageOrdering(83, 88).
pageOrdering(83, 77).
pageOrdering(83, 16).
pageOrdering(83, 32).
pageOrdering(83, 68).
pageOrdering(83, 76).
pageOrdering(83, 95).
pageOrdering(83, 99).
pageOrdering(72, 99).
pageOrdering(72, 74).
pageOrdering(72, 76).
pageOrdering(72, 13).
pageOrdering(72, 94).
pageOrdering(72, 47).
pageOrdering(72, 23).
pageOrdering(72, 77).
pageOrdering(72, 93).
pageOrdering(72, 32).
pageOrdering(57, 32).
pageOrdering(57, 53).
pageOrdering(57, 74).
pageOrdering(57, 64).
pageOrdering(57, 47).
pageOrdering(57, 95).
pageOrdering(57, 49).
pageOrdering(57, 58).
pageOrdering(57, 68).
pageOrdering(57, 76).
pageOrdering(57, 75).
pageOrdering(47, 78).
pageOrdering(47, 56).
pageOrdering(47, 17).
pageOrdering(47, 18).
pageOrdering(47, 29).
pageOrdering(47, 52).
pageOrdering(47, 26).
pageOrdering(47, 15).
pageOrdering(47, 96).
pageOrdering(47, 55).
pageOrdering(47, 27).
pageOrdering(47, 64).
pageOrdering(74, 29).
pageOrdering(74, 26).
pageOrdering(74, 22).
pageOrdering(74, 39).
pageOrdering(74, 27).
pageOrdering(74, 15).
pageOrdering(74, 88).
pageOrdering(74, 17).
pageOrdering(74, 64).
pageOrdering(74, 49).
pageOrdering(74, 18).
pageOrdering(74, 16).
pageOrdering(74, 47).
pageOrdering(56, 22).
pageOrdering(56, 63).
pageOrdering(56, 15).
pageOrdering(56, 41).
pageOrdering(56, 91).
pageOrdering(56, 86).
pageOrdering(56, 26).
pageOrdering(56, 27).
pageOrdering(56, 55).
pageOrdering(56, 72).
pageOrdering(56, 29).
pageOrdering(56, 17).
pageOrdering(56, 35).
pageOrdering(56, 67).
pageOrdering(67, 98).
pageOrdering(67, 73).
pageOrdering(67, 12).
pageOrdering(67, 83).
pageOrdering(67, 33).
pageOrdering(67, 23).
pageOrdering(67, 86).
pageOrdering(67, 87).
pageOrdering(67, 72).
pageOrdering(67, 15).
pageOrdering(67, 95).
pageOrdering(67, 79).
pageOrdering(67, 85).
pageOrdering(67, 91).
pageOrdering(67, 39).
pageOrdering(87, 93).
pageOrdering(87, 12).
pageOrdering(87, 14).
pageOrdering(87, 98).
pageOrdering(87, 32).
pageOrdering(87, 86).
pageOrdering(87, 74).
pageOrdering(87, 52).
pageOrdering(87, 72).
pageOrdering(87, 99).
pageOrdering(87, 76).
pageOrdering(87, 73).
pageOrdering(87, 57).
pageOrdering(87, 85).
pageOrdering(87, 23).
pageOrdering(87, 94).
pageOrdering(12, 93).
pageOrdering(12, 96).
pageOrdering(12, 76).
pageOrdering(12, 57).
pageOrdering(12, 49).
pageOrdering(12, 98).
pageOrdering(12, 58).
pageOrdering(12, 73).
pageOrdering(12, 74).
pageOrdering(12, 64).
pageOrdering(12, 32).
pageOrdering(12, 53).
pageOrdering(12, 68).
pageOrdering(12, 13).
pageOrdering(12, 77).
pageOrdering(12, 99).
pageOrdering(12, 85).
pageOrdering(98, 14).
pageOrdering(98, 85).
pageOrdering(98, 75).
pageOrdering(98, 83).
pageOrdering(98, 13).
pageOrdering(98, 23).
pageOrdering(98, 53).
pageOrdering(98, 32).
pageOrdering(98, 95).
pageOrdering(98, 64).
pageOrdering(98, 74).
pageOrdering(98, 77).
pageOrdering(98, 73).
pageOrdering(98, 96).
pageOrdering(98, 57).
pageOrdering(98, 58).
pageOrdering(98, 99).
pageOrdering(98, 93).
pageOrdering(58, 63).
pageOrdering(58, 75).
pageOrdering(58, 88).
pageOrdering(58, 13).
pageOrdering(58, 67).
pageOrdering(58, 49).
pageOrdering(58, 18).
pageOrdering(58, 26).
pageOrdering(58, 47).
pageOrdering(58, 15).
pageOrdering(58, 68).
pageOrdering(58, 77).
pageOrdering(58, 56).
pageOrdering(58, 74).
pageOrdering(58, 78).
pageOrdering(58, 16).
pageOrdering(58, 96).
pageOrdering(58, 14).
pageOrdering(58, 99).
pageOrdering(32, 96).
pageOrdering(32, 88).
pageOrdering(32, 13).
pageOrdering(32, 47).
pageOrdering(32, 68).
pageOrdering(32, 63).
pageOrdering(32, 29).
pageOrdering(32, 49).
pageOrdering(32, 75).
pageOrdering(32, 78).
pageOrdering(32, 26).
pageOrdering(32, 58).
pageOrdering(32, 14).
pageOrdering(32, 41).
pageOrdering(32, 67).
pageOrdering(32, 27).
pageOrdering(32, 74).
pageOrdering(32, 18).
pageOrdering(32, 76).
pageOrdering(32, 16).
pageOrdering(17, 94).
pageOrdering(17, 98).
pageOrdering(17, 13).
pageOrdering(17, 83).
pageOrdering(17, 73).
pageOrdering(17, 95).
pageOrdering(17, 14).
pageOrdering(17, 32).
pageOrdering(17, 86).
pageOrdering(17, 76).
pageOrdering(17, 57).
pageOrdering(17, 53).
pageOrdering(17, 72).
pageOrdering(17, 99).
pageOrdering(17, 87).
pageOrdering(17, 35).
pageOrdering(17, 85).
pageOrdering(17, 52).
pageOrdering(17, 12).
pageOrdering(17, 39).
pageOrdering(17, 58).
pageOrdering(94, 49).
pageOrdering(94, 13).
pageOrdering(94, 47).
pageOrdering(94, 53).
pageOrdering(94, 77).
pageOrdering(94, 57).
pageOrdering(94, 98).
pageOrdering(94, 83).
pageOrdering(94, 73).
pageOrdering(94, 85).
pageOrdering(94, 74).
pageOrdering(94, 14).
pageOrdering(94, 12).
pageOrdering(94, 95).
pageOrdering(94, 32).
pageOrdering(94, 79).
pageOrdering(94, 64).
pageOrdering(94, 93).
pageOrdering(94, 68).
pageOrdering(94, 23).
pageOrdering(94, 76).
pageOrdering(94, 99).
pageOrdering(22, 32).
pageOrdering(22, 86).
pageOrdering(22, 58).
pageOrdering(22, 13).
pageOrdering(22, 52).
pageOrdering(22, 93).
pageOrdering(22, 98).
pageOrdering(22, 94).
pageOrdering(22, 57).
pageOrdering(22, 85).
pageOrdering(22, 39).
pageOrdering(22, 23).
pageOrdering(22, 55).
pageOrdering(22, 72).
pageOrdering(22, 73).
pageOrdering(22, 79).
pageOrdering(22, 35).
pageOrdering(22, 12).
pageOrdering(22, 87).
pageOrdering(22, 17).
pageOrdering(22, 83).
pageOrdering(22, 33).
pageOrdering(22, 95).
pageOrdering(15, 94).
pageOrdering(15, 22).
pageOrdering(15, 91).
pageOrdering(15, 98).
pageOrdering(15, 55).
pageOrdering(15, 57).
pageOrdering(15, 72).
pageOrdering(15, 52).
pageOrdering(15, 83).
pageOrdering(15, 53).
pageOrdering(15, 95).
pageOrdering(15, 12).
pageOrdering(15, 32).
pageOrdering(15, 93).
pageOrdering(15, 86).
pageOrdering(15, 17).
pageOrdering(15, 79).
pageOrdering(15, 23).
pageOrdering(15, 35).
pageOrdering(15, 39).
pageOrdering(15, 87).
pageOrdering(15, 73).
pageOrdering(15, 85).
pageOrdering(15, 33).
pageOrdering(41, 55).
pageOrdering(41, 22).
pageOrdering(41, 86).
pageOrdering(41, 15).
pageOrdering(41, 52).
pageOrdering(41, 79).
pageOrdering(41, 98).
pageOrdering(41, 12).
pageOrdering(41, 93).
pageOrdering(41, 91).
pageOrdering(41, 33).
pageOrdering(41, 57).
pageOrdering(41, 35).
pageOrdering(41, 73).
pageOrdering(41, 87).
pageOrdering(41, 83).
pageOrdering(41, 72).
pageOrdering(41, 17).
pageOrdering(41, 94).
pageOrdering(41, 95).
pageOrdering(41, 53).
pageOrdering(41, 67).
pageOrdering(41, 39).
pageOrdering(41, 23).
pageOrdering(93, 58).
pageOrdering(93, 77).
pageOrdering(93, 56).
pageOrdering(93, 88).
pageOrdering(93, 74).
pageOrdering(93, 64).
pageOrdering(93, 23).
pageOrdering(93, 29).
pageOrdering(93, 49).
pageOrdering(93, 95).
pageOrdering(93, 27).
pageOrdering(93, 32).
pageOrdering(93, 85).
pageOrdering(93, 47).
pageOrdering(93, 78).
pageOrdering(93, 75).
pageOrdering(93, 83).
pageOrdering(93, 13).
pageOrdering(93, 76).
pageOrdering(93, 99).
pageOrdering(93, 68).
pageOrdering(93, 14).
pageOrdering(93, 96).
pageOrdering(93, 53).
pageOrdering(91, 94).
pageOrdering(91, 83).
pageOrdering(91, 32).
pageOrdering(91, 73).
pageOrdering(91, 17).
pageOrdering(91, 23).
pageOrdering(91, 39).
pageOrdering(91, 87).
pageOrdering(91, 58).
pageOrdering(91, 72).
pageOrdering(91, 86).
pageOrdering(91, 12).
pageOrdering(91, 79).
pageOrdering(91, 35).
pageOrdering(91, 85).
pageOrdering(91, 22).
pageOrdering(91, 53).
pageOrdering(91, 98).
pageOrdering(91, 93).
pageOrdering(91, 57).
pageOrdering(91, 95).
pageOrdering(91, 33).
pageOrdering(91, 52).
pageOrdering(91, 55).
pageOrdering(23, 95).
pageOrdering(23, 47).
pageOrdering(23, 76).
pageOrdering(23, 99).
pageOrdering(23, 26).
pageOrdering(23, 53).
pageOrdering(23, 14).
pageOrdering(23, 49).
pageOrdering(23, 77).
pageOrdering(23, 13).
pageOrdering(23, 68).
pageOrdering(23, 74).
pageOrdering(23, 29).
pageOrdering(23, 58).
pageOrdering(23, 64).
pageOrdering(23, 56).
pageOrdering(23, 96).
pageOrdering(23, 85).
pageOrdering(23, 83).
pageOrdering(23, 32).
pageOrdering(23, 27).
pageOrdering(23, 78).
pageOrdering(23, 75).
pageOrdering(23, 88).
pageOrdering(55, 98).
pageOrdering(55, 57).
pageOrdering(55, 52).
pageOrdering(55, 35).
pageOrdering(55, 87).
pageOrdering(55, 79).
pageOrdering(55, 73).
pageOrdering(55, 32).
pageOrdering(55, 95).
pageOrdering(55, 39).
pageOrdering(55, 58).
pageOrdering(55, 23).
pageOrdering(55, 17).
pageOrdering(55, 86).
pageOrdering(55, 72).
pageOrdering(55, 83).
pageOrdering(55, 12).
pageOrdering(55, 53).
pageOrdering(55, 94).
pageOrdering(55, 13).
pageOrdering(55, 14).
pageOrdering(55, 85).
pageOrdering(55, 93).
pageOrdering(55, 99).
pageOrdering(53, 85).
pageOrdering(53, 99).
pageOrdering(53, 49).
pageOrdering(53, 26).
pageOrdering(53, 47).
pageOrdering(53, 88).
pageOrdering(53, 27).
pageOrdering(53, 78).
pageOrdering(53, 83).
pageOrdering(53, 14).
pageOrdering(53, 58).
pageOrdering(53, 56).
pageOrdering(53, 32).
pageOrdering(53, 18).
pageOrdering(53, 75).
pageOrdering(53, 29).
pageOrdering(53, 68).
pageOrdering(53, 95).
pageOrdering(53, 76).
pageOrdering(53, 96).
pageOrdering(53, 74).
pageOrdering(53, 77).
pageOrdering(53, 13).
pageOrdering(53, 64).
pageOrdering(63, 94).
pageOrdering(63, 55).
pageOrdering(63, 53).
pageOrdering(63, 35).
pageOrdering(63, 73).
pageOrdering(63, 83).
pageOrdering(63, 67).
pageOrdering(63, 15).
pageOrdering(63, 57).
pageOrdering(63, 12).
pageOrdering(63, 39).
pageOrdering(63, 72).
pageOrdering(63, 86).
pageOrdering(63, 33).
pageOrdering(63, 41).
pageOrdering(63, 79).
pageOrdering(63, 91).
pageOrdering(63, 98).
pageOrdering(63, 22).
pageOrdering(63, 87).
pageOrdering(63, 23).
pageOrdering(63, 93).
pageOrdering(63, 17).
pageOrdering(63, 52).
pageOrdering(75, 94).
pageOrdering(75, 91).
pageOrdering(75, 87).
pageOrdering(75, 17).
pageOrdering(75, 56).
pageOrdering(75, 27).
pageOrdering(75, 33).
pageOrdering(75, 67).
pageOrdering(75, 78).
pageOrdering(75, 55).
pageOrdering(75, 18).
pageOrdering(75, 86).
pageOrdering(75, 63).
pageOrdering(75, 16).
pageOrdering(75, 52).
pageOrdering(75, 29).
pageOrdering(75, 72).
pageOrdering(75, 22).
pageOrdering(75, 39).
pageOrdering(75, 35).
pageOrdering(75, 26).
pageOrdering(75, 41).
pageOrdering(75, 15).
pageOrdering(75, 88).
pageOrdering(73, 64).
pageOrdering(73, 13).
pageOrdering(73, 74).
pageOrdering(73, 14).
pageOrdering(73, 53).
pageOrdering(73, 93).
pageOrdering(73, 23).
pageOrdering(73, 29).
pageOrdering(73, 76).
pageOrdering(73, 85).
pageOrdering(73, 88).
pageOrdering(73, 68).
pageOrdering(73, 56).
pageOrdering(73, 96).
pageOrdering(73, 75).
pageOrdering(73, 83).
pageOrdering(73, 77).
pageOrdering(73, 58).
pageOrdering(73, 99).
pageOrdering(73, 47).
pageOrdering(73, 57).
pageOrdering(73, 32).
pageOrdering(73, 95).
pageOrdering(73, 49).
pageOrdering(16, 33).
pageOrdering(16, 15).
pageOrdering(16, 72).
pageOrdering(16, 55).
pageOrdering(16, 12).
pageOrdering(16, 93).
pageOrdering(16, 53).
pageOrdering(16, 52).
pageOrdering(16, 22).
pageOrdering(16, 98).
pageOrdering(16, 17).
pageOrdering(16, 39).
pageOrdering(16, 79).
pageOrdering(16, 63).
pageOrdering(16, 41).
pageOrdering(16, 57).
pageOrdering(16, 87).
pageOrdering(16, 91).
pageOrdering(16, 86).
pageOrdering(16, 23).
pageOrdering(16, 35).
pageOrdering(16, 73).
pageOrdering(16, 67).
pageOrdering(16, 94).
pageOrdering(86, 68).
pageOrdering(86, 72).
pageOrdering(86, 83).
pageOrdering(86, 73).
pageOrdering(86, 95).
pageOrdering(86, 93).
pageOrdering(86, 47).
pageOrdering(86, 12).
pageOrdering(86, 13).
pageOrdering(86, 99).
pageOrdering(86, 76).
pageOrdering(86, 74).
pageOrdering(86, 58).
pageOrdering(86, 79).
pageOrdering(86, 98).
pageOrdering(86, 85).
pageOrdering(86, 53).
pageOrdering(86, 23).
pageOrdering(86, 94).
pageOrdering(86, 14).
pageOrdering(86, 32).
pageOrdering(86, 57).
pageOrdering(86, 77).
pageOrdering(86, 35).
pageOrdering(13, 68).
pageOrdering(13, 49).
pageOrdering(13, 63).
pageOrdering(13, 16).
pageOrdering(13, 77).
pageOrdering(13, 88).
pageOrdering(13, 99).
pageOrdering(13, 27).
pageOrdering(13, 67).
pageOrdering(13, 15).
pageOrdering(13, 14).
pageOrdering(13, 74).
pageOrdering(13, 26).
pageOrdering(13, 76).
pageOrdering(13, 64).
pageOrdering(13, 91).
pageOrdering(13, 75).
pageOrdering(13, 78).
pageOrdering(13, 96).
pageOrdering(13, 18).
pageOrdering(13, 41).
pageOrdering(13, 56).
pageOrdering(13, 29).
pageOrdering(13, 47).
pageOrdering(26, 57).
pageOrdering(26, 33).
pageOrdering(26, 87).
pageOrdering(26, 16).
pageOrdering(26, 98).
pageOrdering(26, 94).
pageOrdering(26, 35).
pageOrdering(26, 12).
pageOrdering(26, 18).
pageOrdering(26, 73).
pageOrdering(26, 67).
pageOrdering(26, 52).
pageOrdering(26, 41).
pageOrdering(26, 86).
pageOrdering(26, 79).
pageOrdering(26, 17).
pageOrdering(26, 55).
pageOrdering(26, 63).
pageOrdering(26, 39).
pageOrdering(26, 72).
pageOrdering(26, 15).
pageOrdering(26, 91).
pageOrdering(26, 93).
pageOrdering(26, 22).
pageOrdering(18, 91).
pageOrdering(18, 23).
pageOrdering(18, 87).
pageOrdering(18, 73).
pageOrdering(18, 55).
pageOrdering(18, 67).
pageOrdering(18, 35).
pageOrdering(18, 12).
pageOrdering(18, 94).
pageOrdering(18, 16).
pageOrdering(18, 57).
pageOrdering(18, 15).
pageOrdering(18, 39).
pageOrdering(18, 86).
pageOrdering(18, 63).
pageOrdering(18, 17).
pageOrdering(18, 79).
pageOrdering(18, 22).
pageOrdering(18, 52).
pageOrdering(18, 41).
pageOrdering(18, 72).
pageOrdering(18, 93).
pageOrdering(18, 33).
pageOrdering(18, 98).
pageOrdering(77, 17).
pageOrdering(77, 63).
pageOrdering(77, 26).
pageOrdering(77, 29).
pageOrdering(77, 56).
pageOrdering(77, 74).
pageOrdering(77, 22).
pageOrdering(77, 67).
pageOrdering(77, 88).
pageOrdering(77, 18).
pageOrdering(77, 68).
pageOrdering(77, 75).
pageOrdering(77, 41).
pageOrdering(77, 91).
pageOrdering(77, 47).
pageOrdering(77, 33).
pageOrdering(77, 96).
pageOrdering(77, 16).
pageOrdering(77, 49).
pageOrdering(77, 78).
pageOrdering(77, 55).
pageOrdering(77, 27).
pageOrdering(77, 64).
pageOrdering(77, 15).
pageOrdering(27, 16).
pageOrdering(27, 12).
pageOrdering(27, 41).
pageOrdering(27, 33).
pageOrdering(27, 18).
pageOrdering(27, 57).
pageOrdering(27, 72).
pageOrdering(27, 79).
pageOrdering(27, 87).
pageOrdering(27, 86).
pageOrdering(27, 35).
pageOrdering(27, 15).
pageOrdering(27, 55).
pageOrdering(27, 63).
pageOrdering(27, 39).
pageOrdering(27, 91).
pageOrdering(27, 98).
pageOrdering(27, 94).
pageOrdering(27, 73).
pageOrdering(27, 26).
pageOrdering(27, 52).
pageOrdering(27, 22).
pageOrdering(27, 17).
pageOrdering(27, 67).
pageOrdering(39, 93).
pageOrdering(39, 14).
pageOrdering(39, 86).
pageOrdering(39, 72).
pageOrdering(39, 85).
pageOrdering(39, 76).
pageOrdering(39, 32).
pageOrdering(39, 94).
pageOrdering(39, 52).
pageOrdering(39, 98).
pageOrdering(39, 53).
pageOrdering(39, 87).
pageOrdering(39, 12).
pageOrdering(39, 77).
pageOrdering(39, 35).
pageOrdering(39, 95).
pageOrdering(39, 73).
pageOrdering(39, 13).
pageOrdering(39, 23).
pageOrdering(39, 58).
pageOrdering(39, 57).
pageOrdering(39, 79).
pageOrdering(39, 83).
pageOrdering(39, 99).
pageOrdering(99, 67).
pageOrdering(99, 96).
pageOrdering(99, 77).
pageOrdering(99, 16).
pageOrdering(99, 29).
pageOrdering(99, 26).
pageOrdering(99, 18).
pageOrdering(99, 68).
pageOrdering(99, 91).
pageOrdering(99, 76).
pageOrdering(99, 64).
pageOrdering(99, 75).
pageOrdering(99, 27).
pageOrdering(99, 41).
pageOrdering(99, 22).
pageOrdering(99, 63).
pageOrdering(99, 49).
pageOrdering(99, 78).
pageOrdering(99, 56).
pageOrdering(99, 88).
pageOrdering(99, 74).
pageOrdering(99, 15).
pageOrdering(99, 47).
pageOrdering(99, 33).
pageOrdering(79, 49).
pageOrdering(79, 93).
pageOrdering(79, 23).
pageOrdering(79, 77).
pageOrdering(79, 73).
pageOrdering(79, 83).
pageOrdering(79, 64).
pageOrdering(79, 47).
pageOrdering(79, 98).
pageOrdering(79, 14).
pageOrdering(79, 76).
pageOrdering(79, 85).
pageOrdering(79, 53).
pageOrdering(79, 57).
pageOrdering(79, 99).
pageOrdering(79, 32).
pageOrdering(79, 74).
pageOrdering(79, 13).
pageOrdering(79, 58).
pageOrdering(79, 96).
pageOrdering(79, 75).
pageOrdering(79, 95).
pageOrdering(79, 68).
pageOrdering(79, 12).
pageOrdering(76, 27).
pageOrdering(76, 77).
pageOrdering(76, 22).
pageOrdering(76, 56).
pageOrdering(76, 29).
pageOrdering(76, 49).
pageOrdering(76, 68).
pageOrdering(76, 18).
pageOrdering(76, 64).
pageOrdering(76, 74).
pageOrdering(76, 33).
pageOrdering(76, 41).
pageOrdering(76, 16).
pageOrdering(76, 55).
pageOrdering(76, 15).
pageOrdering(76, 91).
pageOrdering(76, 26).
pageOrdering(76, 78).
pageOrdering(76, 67).
pageOrdering(76, 75).
pageOrdering(76, 96).
pageOrdering(76, 63).
pageOrdering(76, 88).
pageOrdering(76, 47).
pageOrdering(14, 78).
pageOrdering(14, 63).
pageOrdering(14, 75).
pageOrdering(14, 77).
pageOrdering(14, 29).
pageOrdering(14, 15).
pageOrdering(14, 91).
pageOrdering(14, 16).
pageOrdering(14, 76).
pageOrdering(14, 68).
pageOrdering(14, 74).
pageOrdering(14, 27).
pageOrdering(14, 64).
pageOrdering(14, 96).
pageOrdering(14, 56).
pageOrdering(14, 99).
pageOrdering(14, 67).
pageOrdering(14, 88).
pageOrdering(14, 47).
pageOrdering(14, 41).
pageOrdering(14, 22).
pageOrdering(14, 49).
pageOrdering(14, 18).
pageOrdering(14, 26).
pageOrdering(78, 52).
pageOrdering(78, 35).
pageOrdering(78, 15).
pageOrdering(78, 18).
pageOrdering(78, 16).
pageOrdering(78, 67).
pageOrdering(78, 12).
pageOrdering(78, 86).
pageOrdering(78, 63).
pageOrdering(78, 79).
pageOrdering(78, 17).
pageOrdering(78, 22).
pageOrdering(78, 27).
pageOrdering(78, 94).
pageOrdering(78, 39).
pageOrdering(78, 55).
pageOrdering(78, 72).
pageOrdering(78, 73).
pageOrdering(78, 33).
pageOrdering(78, 26).
pageOrdering(78, 91).
pageOrdering(78, 98).
pageOrdering(78, 41).
pageOrdering(78, 87).
pageOrdering(35, 76).
pageOrdering(35, 58).
pageOrdering(35, 14).
pageOrdering(35, 12).
pageOrdering(35, 64).
pageOrdering(35, 79).
pageOrdering(35, 99).
pageOrdering(35, 93).
pageOrdering(35, 98).
pageOrdering(35, 53).
pageOrdering(35, 77).
pageOrdering(35, 47).
pageOrdering(35, 32).
pageOrdering(35, 68).
pageOrdering(35, 94).
pageOrdering(35, 57).
pageOrdering(35, 85).
pageOrdering(35, 73).
pageOrdering(35, 83).
pageOrdering(35, 95).
pageOrdering(35, 23).
pageOrdering(35, 13).
pageOrdering(35, 72).
pageOrdering(35, 74).
pageOrdering(29, 87).
pageOrdering(29, 86).
pageOrdering(29, 26).
pageOrdering(29, 18).
pageOrdering(29, 15).
pageOrdering(29, 35).
pageOrdering(29, 41).
pageOrdering(29, 78).
pageOrdering(29, 52).
pageOrdering(29, 33).
pageOrdering(29, 98).
pageOrdering(29, 72).
pageOrdering(29, 63).
pageOrdering(29, 17).
pageOrdering(29, 67).
pageOrdering(29, 27).
pageOrdering(29, 16).
pageOrdering(29, 79).
pageOrdering(29, 39).
pageOrdering(29, 91).
pageOrdering(29, 55).
pageOrdering(29, 22).
pageOrdering(29, 94).
pageOrdering(29, 12).
pageOrdering(95, 49).
pageOrdering(95, 99).
pageOrdering(95, 56).
pageOrdering(95, 27).
pageOrdering(95, 29).
pageOrdering(95, 26).
pageOrdering(95, 63).
pageOrdering(95, 74).
pageOrdering(95, 47).
pageOrdering(95, 16).
pageOrdering(95, 96).
pageOrdering(95, 18).
pageOrdering(95, 58).
pageOrdering(95, 14).
pageOrdering(95, 88).
pageOrdering(95, 76).
pageOrdering(95, 78).
pageOrdering(95, 13).
pageOrdering(95, 85).
pageOrdering(95, 32).
pageOrdering(95, 75).
pageOrdering(95, 68).
pageOrdering(95, 77).
pageOrdering(95, 64).
pageOrdering(96, 33).
pageOrdering(96, 87).
pageOrdering(96, 18).
pageOrdering(96, 39).
pageOrdering(96, 55).
pageOrdering(96, 17).
pageOrdering(96, 75).
pageOrdering(96, 41).
pageOrdering(96, 15).
pageOrdering(96, 35).
pageOrdering(96, 63).
pageOrdering(96, 88).
pageOrdering(96, 27).
pageOrdering(96, 29).
pageOrdering(96, 86).
pageOrdering(96, 49).
pageOrdering(96, 22).
pageOrdering(96, 78).
pageOrdering(96, 52).
pageOrdering(96, 67).
pageOrdering(96, 16).
pageOrdering(96, 91).
pageOrdering(96, 26).
pageOrdering(68, 88).
pageOrdering(68, 56).
pageOrdering(68, 55).
pageOrdering(68, 63).
pageOrdering(68, 67).
pageOrdering(68, 39).
pageOrdering(68, 16).
pageOrdering(68, 27).
pageOrdering(68, 75).
pageOrdering(68, 49).
pageOrdering(68, 15).
pageOrdering(68, 18).
pageOrdering(68, 29).
pageOrdering(68, 64).
pageOrdering(68, 47).
pageOrdering(68, 87).
pageOrdering(68, 33).
pageOrdering(68, 41).
pageOrdering(68, 22).
pageOrdering(68, 26).
pageOrdering(68, 91).
pageOrdering(68, 17).
pageOrdering(52, 77).
pageOrdering(52, 98).
pageOrdering(52, 68).
pageOrdering(52, 74).
pageOrdering(52, 73).
pageOrdering(52, 99).
pageOrdering(52, 12).
pageOrdering(52, 83).
pageOrdering(52, 53).
pageOrdering(52, 86).
pageOrdering(52, 13).
pageOrdering(52, 57).
pageOrdering(52, 23).
pageOrdering(52, 95).
pageOrdering(52, 72).
pageOrdering(52, 58).
pageOrdering(52, 94).
pageOrdering(52, 93).
pageOrdering(52, 32).
pageOrdering(52, 35).
pageOrdering(52, 79).
pageOrdering(85, 58).
pageOrdering(85, 78).
pageOrdering(85, 27).
pageOrdering(85, 74).
pageOrdering(85, 63).
pageOrdering(85, 56).
pageOrdering(85, 32).
pageOrdering(85, 77).
pageOrdering(85, 16).
pageOrdering(85, 47).
pageOrdering(85, 64).
pageOrdering(85, 68).
pageOrdering(85, 26).
pageOrdering(85, 29).
pageOrdering(85, 99).
pageOrdering(85, 88).
pageOrdering(85, 14).
pageOrdering(85, 49).
pageOrdering(85, 41).
pageOrdering(85, 76).
pageOrdering(64, 17).
pageOrdering(64, 52).
pageOrdering(64, 27).
pageOrdering(64, 33).
pageOrdering(64, 29).
pageOrdering(64, 55).
pageOrdering(64, 22).
pageOrdering(64, 96).
pageOrdering(64, 91).
pageOrdering(64, 78).
pageOrdering(64, 18).
pageOrdering(64, 26).
pageOrdering(64, 67).
pageOrdering(64, 88).
pageOrdering(64, 56).
pageOrdering(64, 86).
pageOrdering(64, 63).
pageOrdering(64, 87).
pageOrdering(64, 39).
pageOrdering(49, 18).
pageOrdering(49, 27).
pageOrdering(49, 63).
pageOrdering(49, 33).
pageOrdering(49, 16).
pageOrdering(49, 26).
pageOrdering(49, 72).
pageOrdering(49, 87).
pageOrdering(49, 52).
pageOrdering(49, 41).
pageOrdering(49, 75).
pageOrdering(49, 29).
pageOrdering(49, 35).
pageOrdering(49, 17).
pageOrdering(49, 15).
pageOrdering(49, 55).
pageOrdering(49, 91).
pageOrdering(49, 39).
pageOrdering(88, 33).
pageOrdering(88, 27).
pageOrdering(88, 39).
pageOrdering(88, 72).
pageOrdering(88, 35).
pageOrdering(88, 26).
pageOrdering(88, 63).
pageOrdering(88, 17).
pageOrdering(88, 15).
pageOrdering(88, 86).
pageOrdering(88, 91).
pageOrdering(88, 78).
pageOrdering(88, 67).
pageOrdering(88, 94).
pageOrdering(88, 79).
pageOrdering(88, 55).
pageOrdering(88, 52).
pageOrdering(33, 32).
pageOrdering(33, 12).
pageOrdering(33, 93).
pageOrdering(33, 55).
pageOrdering(33, 52).
pageOrdering(33, 94).
pageOrdering(33, 86).
pageOrdering(33, 98).
pageOrdering(33, 83).
pageOrdering(33, 23).
pageOrdering(33, 35).
pageOrdering(33, 72).
pageOrdering(33, 87).
pageOrdering(33, 58).
pageOrdering(33, 73).
pageOrdering(33, 79).
pageOrdering(83, 75).
pageOrdering(83, 29).
pageOrdering(83, 13).
pageOrdering(83, 96).
pageOrdering(83, 49).
pageOrdering(83, 26).
pageOrdering(83, 78).
pageOrdering(83, 14).
pageOrdering(83, 64).
pageOrdering(83, 18).
pageOrdering(83, 56).
pageOrdering(83, 27).
pageOrdering(83, 85).
pageOrdering(83, 74).
pageOrdering(83, 58).
pageOrdering(72, 14).
pageOrdering(72, 95).
pageOrdering(72, 68).
pageOrdering(72, 79).
pageOrdering(72, 98).
pageOrdering(72, 53).
pageOrdering(72, 12).
pageOrdering(72, 96).
pageOrdering(72, 64).
pageOrdering(72, 58).
pageOrdering(72, 57).
pageOrdering(72, 85).
pageOrdering(72, 83).
pageOrdering(72, 73).
pageOrdering(57, 56).
pageOrdering(57, 99).
pageOrdering(57, 13).
pageOrdering(57, 78).
pageOrdering(57, 96).
pageOrdering(57, 29).
pageOrdering(57, 14).
pageOrdering(57, 88).
pageOrdering(57, 23).
pageOrdering(57, 93).
pageOrdering(57, 77).
pageOrdering(57, 83).
pageOrdering(57, 85).
pageOrdering(47, 39).
pageOrdering(47, 91).
pageOrdering(47, 16).
pageOrdering(47, 75).
pageOrdering(47, 67).
pageOrdering(47, 33).
pageOrdering(47, 49).
pageOrdering(47, 22).
pageOrdering(47, 63).
pageOrdering(47, 88).
pageOrdering(47, 87).
pageOrdering(47, 41).
pageOrdering(74, 63).
pageOrdering(74, 67).
pageOrdering(74, 56).
pageOrdering(74, 91).
pageOrdering(74, 33).
pageOrdering(74, 55).
pageOrdering(74, 41).
pageOrdering(74, 75).
pageOrdering(74, 96).
pageOrdering(74, 78).
pageOrdering(74, 68).
pageOrdering(56, 16).
pageOrdering(56, 12).
pageOrdering(56, 87).
pageOrdering(56, 52).
pageOrdering(56, 18).
pageOrdering(56, 39).
pageOrdering(56, 33).
pageOrdering(56, 79).
pageOrdering(56, 78).
pageOrdering(56, 94).
pageOrdering(67, 17).
pageOrdering(67, 94).
pageOrdering(67, 57).
pageOrdering(67, 93).
pageOrdering(67, 53).
pageOrdering(67, 22).
pageOrdering(67, 55).
pageOrdering(67, 52).
pageOrdering(67, 35).
pageOrdering(87, 13).
pageOrdering(87, 77).
pageOrdering(87, 79).
pageOrdering(87, 83).
pageOrdering(87, 58).
pageOrdering(87, 53).
pageOrdering(87, 35).
pageOrdering(87, 95).
pageOrdering(12, 14).
pageOrdering(12, 47).
pageOrdering(12, 83).
pageOrdering(12, 88).
pageOrdering(12, 75).
pageOrdering(12, 95).
pageOrdering(12, 23).
pageOrdering(98, 88).
pageOrdering(98, 49).
pageOrdering(98, 47).
pageOrdering(98, 68).
pageOrdering(98, 76).
pageOrdering(98, 56).
pageOrdering(58, 27).
pageOrdering(58, 29).
pageOrdering(58, 41).
pageOrdering(58, 76).
pageOrdering(58, 64).
pageOrdering(32, 99).
pageOrdering(32, 77).
pageOrdering(32, 64).
pageOrdering(32, 56).
pageOrdering(17, 93).
pageOrdering(17, 79).
pageOrdering(17, 23).
pageOrdering(94, 96).
pageOrdering(94, 58).
pageOrdering(22, 53).

safetyManualUpdate([49,85,73,74,96,32,76,58,95,57,13,93,14,99,56,47,75]).
safetyManualUpdate([74,68,64,75,78,18,41,67,15]).
safetyManualUpdate([83,95,85,32,58,14,76,77,74,68,47,96,49,75,88,56,29,78,18]).
safetyManualUpdate([91,33,55,17,39,87,52,86,35,72,94,79,12,98,93,53,83,95,85]).
safetyManualUpdate([12,57,93,23,53,83,95,85,58,14,99,68,64,49,75]).
safetyManualUpdate([96,27,17,64,78,16,56,63,18,87,33,75,22,88,49,91,67,41,55,39,15,29,47]).
safetyManualUpdate([83,33,91,98,93,57,15,72,79,95,73,23,52,87,39,22,86]).
safetyManualUpdate([33,88,27,15,64,63,49,26,87,55,91,22,39,16,29,78,47,41,67,96,17,18,75]).
safetyManualUpdate([22,33,55,17,39,52,86,94,73,23,53,83,95,85,32]).
safetyManualUpdate([67,56,39,52,94,33,22,78,27,18,29,35,63,87,86,26,79]).
safetyManualUpdate([88,68,77,41,33,56,16,74,75,29,47,78,67,63,64,49,18]).
safetyManualUpdate([41,67,15,91,22,33,55,17,39,86,79,12,98,73,57,93,53]).
safetyManualUpdate([52,99,23,73,35,72,87,12,77]).
safetyManualUpdate([85,83,91,23,94,39,33,15,35]).
safetyManualUpdate([55,35,22,86,56,78,15,39,88,94,87,18,17,52,91]).
safetyManualUpdate([79,53,85,58,74,68,49]).
safetyManualUpdate([53,99,79,98,95,12,47,14,64,13,32,85,83,77,23,76,93]).
safetyManualUpdate([56,29,27,26,16,63,22,17,72,94,79]).
safetyManualUpdate([49,88,56,29,18,16,63,41,15,33,39,52,35]).
safetyManualUpdate([33,55,17,39,87,35,72,94,79,12,98,73,57,93,83,95,85,32,13]).
safetyManualUpdate([67,15,73,33,93,91,12,79,41,57,63,55,22,86,98,35,72,94,16]).
safetyManualUpdate([86,33,95,72,79,13,39,57,93,87,83,23,53,85,17,98,94,73,12]).
safetyManualUpdate([87,58,35,94,22,86,72,52,85]).
safetyManualUpdate([39,52,86,35,94,93,53,83,95,85,32,58,14,99,76]).
safetyManualUpdate([96,49,75,88,78,27,26,18,16,63,41,67,15,91,22,33,17,87,86]).
safetyManualUpdate([53,83,14,99,47,96,49]).
safetyManualUpdate([99,23,98,64,77,57,12,74,47,76,75,96,32,49,68,53,93,13,73,83,95]).
safetyManualUpdate([15,22,17,39,87,86,35,73,93,53,83,95,85]).
safetyManualUpdate([33,12,35,86,39,22,17,15,57,87,53,91,98,94,93,95,67,72,73,83,79]).
safetyManualUpdate([76,77,74,68,47,64,96,49,75,88,56,78,27,26,18,16,63,41,67,15,91,22,33]).
safetyManualUpdate([99,76,77,74,68,96,49,75,88,56,78,27,26,18,16,63,41,67,15,91,22]).
safetyManualUpdate([57,75,76,99,64,13,93]).
safetyManualUpdate([86,35,72,52,23,73,15,53,39,12,55,79,33,93,17,83,67,94,57,22,41,87,98]).
safetyManualUpdate([14,99,76,77,74,64,75,88,56,26,63]).
safetyManualUpdate([64,14,99,85,53,98,47,57,83,93,72,77,95,94,73,76,13]).
safetyManualUpdate([52,35,94,79,12,98,73,57,93,23,53,83,95,85,58,13,14,99,76,77,74]).
safetyManualUpdate([93,94,99,96,98,85,79,23,58]).
safetyManualUpdate([64,56,29,18,63,41,67,91,22,55,52]).
safetyManualUpdate([58,13,14,99,77,74,47,64,96,49,75,88,56,29,78,26,18,63,67]).
safetyManualUpdate([17,53,22,12,58,93,83]).
safetyManualUpdate([83,32,77,74,96,78,18]).
safetyManualUpdate([56,47,58,88,75,49,27,95,26,85,78,99,74,77,68,18,29,76,16,13,32]).
safetyManualUpdate([56,29,78,18,63,41,67,15,91,22,55,17,39,87,52,35,72,94,79]).
safetyManualUpdate([16,41,33,55,72,79,73,93,23]).
safetyManualUpdate([13,76,57,49,95,58,32,23,14,75,77,53,47,85,56,64,96]).
safetyManualUpdate([93,53,83,58,76,77,68,96,49,75,88,56,78]).
safetyManualUpdate([35,72,79,12,98,73,93,23,83,95,85,58,14,99,76,77,74,68,47]).
safetyManualUpdate([88,56,29,78,27,26,18,63,41,67,15,91,22,33,55,17,39,87,52,86,35,72,94]).
safetyManualUpdate([98,53,32,58,76]).
safetyManualUpdate([88,56,78,27,26,18,16,41,67,15,91,33,17,39,87,52,86,72,94]).
safetyManualUpdate([29,96,85,23,56,95,83,76,47,64,78,77,74,49,53,58,75]).
safetyManualUpdate([53,83,95,85,32,58,13,14,99,76,74,47,49,75,88,56,29,78,27]).
safetyManualUpdate([55,33,23,79,95,72,85,86,15,73,17,39,52,91,98,93,12]).
safetyManualUpdate([94,79,12,98,73,93,53,83,95,85,32,14,99,76,68,64,96]).
safetyManualUpdate([22,55,17,39,87,52,35,72,94,79,12,98,73,57,93,23,95,85,58]).
safetyManualUpdate([77,74,68,64,96,49,75,88,29,78,27,26,18,16,63,41,67,15,91,33,55]).
safetyManualUpdate([78,93,76,99,68,96,49]).
safetyManualUpdate([99,76,74,68,64,27,26,41,22]).
safetyManualUpdate([18,49,56,29,63,75,68,55,91,27,15]).
safetyManualUpdate([56,78,27,26,18,16,63,41,67,15,91,33,55,87,52]).
safetyManualUpdate([64,88,29,18,91,55,17,39,52]).
safetyManualUpdate([77,74,68,47,64,96,49,75,88,29,78,27,26,18,16,63,67,15,91,22,33]).
safetyManualUpdate([57,67,73,87,35,95,86]).
safetyManualUpdate([49,93,68,74,95,32,57,29,64,75,14,13,53,77,96]).
safetyManualUpdate([74,68,47,64,49,75,88,56,29,78,27,26,18,16,63,41,91,22,33,55,17]).
safetyManualUpdate([39,52,49,26,22,33,78]).
safetyManualUpdate([26,63,91,55,17,39,86,72,94,79,57]).
safetyManualUpdate([94,52,53,87,32,33,57,13,39,85,79,95,35,86,12,23,98]).
safetyManualUpdate([23,72,14,98,57,64,12,13,93,47,95,68,85,79,73]).
safetyManualUpdate([26,67,18,39,33,16,78,49,15,56,96,63,75,68,91]).
safetyManualUpdate([14,63,74,99,64,15,88]).
safetyManualUpdate([55,16,41,67,49,22,39,56,17,29,63,33,26,68,96]).
safetyManualUpdate([55,63,67,27,79,78,87,41,56,15,86,22,91,17,18]).
safetyManualUpdate([22,55,17,39,35,72,94,98,73,93,23,83,58]).
safetyManualUpdate([73,57,23,53,83,58,13,14,76,47,75]).
safetyManualUpdate([12,98,73,57,93,23,53,83,85,32,58,13,14,99,76,74,68,47,96,49,75]).
safetyManualUpdate([39,79,98,57,83,14,76]).
safetyManualUpdate([53,76,77,68,49,88,56,27,26]).
safetyManualUpdate([72,57,95,58,13,47,64]).
safetyManualUpdate([64,88,29,78,26,16,63,15,91,55,17,39,52]).
safetyManualUpdate([83,95,85,58,13,14,99,76,77,74,68,47,64,96,49,56,78,27,18]).
safetyManualUpdate([95,85,32,58,13,14,99,76,77,74,47,64,96,49,75,88,56,29,78,27,26,18,16]).
safetyManualUpdate([64,96,49,75,88,56,29,78,27,26,18,16,63,67,15,22,17,39,52]).
safetyManualUpdate([22,53,72,23,73,33,63]).
safetyManualUpdate([12,52,76,95,74,72,73]).
safetyManualUpdate([73,57,93,23,53,83,95,85,32,58,13,14,99,76,77,74,47,64,96,49,75]).
safetyManualUpdate([14,83,98,68,75,88,49,93,57,99,85]).
safetyManualUpdate([17,39,52,35,72,94,79,12,98,73,93,23,53,83,95,58,13,14,99]).
safetyManualUpdate([16,91,87,22,15,41,88,96,78,17,33,86,26,67,75,29,18,27,49]).
safetyManualUpdate([18,41,22,33,16,12,91,87,35,72,15,52,93]).
safetyManualUpdate([78,75,85,76,13,32,56,29,88,93,68,47,49,77,53,58,74,14,96,99,83]).
safetyManualUpdate([96,85,58,53,77,26,56,13,64,75,99,49,47,88,68,14,83,27,74,78,95,32,76]).
safetyManualUpdate([35,94,79,73,23,53,83,95,32,58,74]).
safetyManualUpdate([74,29,17,33,16,64,27,47,75]).
safetyManualUpdate([35,17,52,91,27,56,18,22,16,39,63]).
safetyManualUpdate([17,39,35,15,23,22,52,12,94,73,41,93,33,91,98,79,67,86,55,72,87]).
safetyManualUpdate([55,17,39,87,52,86,35,94,12,98,57,93,23,53,95,32,58]).
safetyManualUpdate([98,53,99,68,85,83,47,64,76,75,58,95,49,13,96,32,88,57,77]).
safetyManualUpdate([23,53,32,58,77,74,68,47,96,49,88,56,29,78,27]).
safetyManualUpdate([91,27,15,41,75,68,67,26,29,56,49,76,14]).
safetyManualUpdate([76,77,74,68,47,64,75,29,78,27,26,16,63,41,67,15,91,22,33]).
safetyManualUpdate([27,26,63,15,17,52,35,94,12]).
safetyManualUpdate([68,49,63,41,15,91,39]).
safetyManualUpdate([41,67,15,91,33,55,17,39,87,52,35,72,94,79,12,93,23,53,83]).
safetyManualUpdate([98,93,77,74,13,64,14,68,95,96,83,99,12,94,53,79,85,58,73]).
safetyManualUpdate([85,88,78,32,99,49,26,64,76]).
safetyManualUpdate([88,56,29,78,26,16,63,41,67,15,91,33,17,39,87,52,35,72,94]).
safetyManualUpdate([16,67,56,77,33,91,96,75,29,63,76,15,64,27,78,22,26,49,88,18,41]).
safetyManualUpdate([68,47,64,96,49,75,56,78,27,26,18,16,63,41,67,15,22,33,55,17,39]).
safetyManualUpdate([41,15,52,35,72,98,73,57,23,53,83]).
safetyManualUpdate([53,23,98,47,95]).
safetyManualUpdate([39,52,67,57,93,15,98,91,17,16,94,55,41,18,73]).
safetyManualUpdate([17,86,35,79,73,57,53,95,32,58,13,14,99]).
safetyManualUpdate([26,75,32,49,64,53,47,88,99,77,68,85,96,29,76,14,58]).
safetyManualUpdate([49,58,63,27,13,32,77,76,26,41,29,99,14]).
safetyManualUpdate([35,79,83,13,76,68,47]).
safetyManualUpdate([77,12,99,87,98,32,53]).
safetyManualUpdate([23,53,95,85,58,13,14,99,77,68,96,75,88,56,29,78,27]).
safetyManualUpdate([63,13,88,75,96,77,67,47,16,76,74,56,64,14,58]).
safetyManualUpdate([77,74,68,26,18,67,91]).
safetyManualUpdate([16,67,91,56,33,29,18,41,17,26,86,78,22,96,52,75,49,39,63,55,27]).
safetyManualUpdate([41,67,15,91,17,87,52,72,94,79,98,73,57,93,23,53,83]).
safetyManualUpdate([56,29,78,67,55,87,35,94,79]).
safetyManualUpdate([14,47,88,63,68,16,27,76,75,32,85,99,18,26,96,49,13,58,29,74,77]).
safetyManualUpdate([47,95,58,13,98,99,77,64,68,93,12,57,53,85,74,73,72,32,94]).
safetyManualUpdate([94,93,12,68,14,74,85,98,83,86,32,77,79,57,76,72,73,23,95]).
safetyManualUpdate([63,41,67,15,55,72,94,79,12,98,73,57,93,23,53]).
safetyManualUpdate([53,83,95,85,32,58,13,14,99,76,77,68,47,64,96,49,75,88,56,29,78,27,26]).
safetyManualUpdate([99,76,68,47,64,96,49,75,88,29,78,16,67]).
safetyManualUpdate([39,15,26,22,94,79,63,35,73,72,18,52,33,57,12,55,16]).
safetyManualUpdate([63,41,67,15,91,33,55,17,39,86,35,72,94,79,12,98,73,57,93,23,53]).
safetyManualUpdate([52,86,35,72,98,73,57,83,32,58,14,77,74]).
safetyManualUpdate([18,16,63,41,67,15,91,22,33,55,39,86,72,94,12,98,73,57,93]).
safetyManualUpdate([56,96,85,58,13,32,75,23,95,77,14,76,83,53,93,73,68]).
safetyManualUpdate([93,13,74,58,12,83,35,68,73,86,23,77,53,94,72,98,79,95,57,99,32,14,76]).
safetyManualUpdate([39,52,94,73,93]).
safetyManualUpdate([16,63,78,98,52,39,22,87,33]).
safetyManualUpdate([35,63,16,91,52,86,41,27,73,55,17,12,98,67,33,22,79,39,15]).
safetyManualUpdate([26,72,55,12,78,52,41,35,63,17,27,94,22,29,67,91,87]).
safetyManualUpdate([35,16,15,78,72,56,22,26,67,55,18,86,33,88,94,87,41,29,63,39,91,27,17]).
safetyManualUpdate([52,41,63,49,17,56,87,18,75,16,33,96,64,91,67]).
safetyManualUpdate([39,53,58,93,57,23,72,83,17,86,94,35,99,85,73,87,12,13,95,98,52]).
safetyManualUpdate([93,53,83,85,32,58,14,68,49,88,56,29,78]).
safetyManualUpdate([98,73,57,93,23,53,83,95,85,58,14,99,77,64,96,75,88]).
safetyManualUpdate([52,86,72,12,98,23,32,58,13,14,76]).
safetyManualUpdate([78,76,74,96,99,47,41,64,77,32,88]).
safetyManualUpdate([79,98,57,53,58,74,47,96,49]).
safetyManualUpdate([13,14,99,76,77,74,68,47,64,96,49,88,56,29,78,27,26,18,16,63,41,67,15]).
safetyManualUpdate([86,72,22,15,39,33,78,41,87,35,55,94,67,17,12,91,79,29,63]).
safetyManualUpdate([12,67,93,53,63,55,22,39,23,72,94,35,91,98,79,41,17,57,15]).
safetyManualUpdate([29,78,27,26,18,16,63,41,67,15,91,22,33,55,39,87,52,86,35,72,94,79,12]).
safetyManualUpdate([52,86,35,94,79,12,73,57,93,23,53,95,85,32,13,14,99,76,74]).
safetyManualUpdate([68,64,63,75,56,32,41]).
safetyManualUpdate([47,75,16,56,67,87,41]).
safetyManualUpdate([86,35,72,94,79,12,98,73,57,23,53,83,95,85,32,58,13,14,99,76,77,74,68]).
safetyManualUpdate([56,78,26,18,63,15,35,94,79]).
safetyManualUpdate([93,23,83,95,85,58,14,99,76,77,74,47,75,88,56,29,78]).
safetyManualUpdate([91,15,39,29,56,35,41,86,18,87,22,75,52,72,63,17,33,27,55,88,78]).
safetyManualUpdate([75,88,78,26,67,91,17,87,52]).
safetyManualUpdate([35,94,98,17,72,32,58,39,95,13,86,73,14,52,83,12,93,53,85,23,79,87,57]).
safetyManualUpdate([12,73,57,93,23,83,85,32,58,13,14,99,76,77,74,47,96,49,75]).
safetyManualUpdate([32,74,77,23,99,52,57,35,14,76,95,86,53]).
safetyManualUpdate([56,99,49,75,27,74,77,63,96,29,47,91,67,22,26,41,88]).
safetyManualUpdate([64,14,49,77,68,47,78,76,13,27,26]).
safetyManualUpdate([35,72,79,12,73,57,83,58,14,99,74,68,47]).
safetyManualUpdate([68,47,64,96,49,75,56,29,78,27,26,63,41,67,15,91,22,33,55,17,39]).
safetyManualUpdate([17,72,23,22,85,79,87,58,73,12,35,55,86,94,32,95,83,93,98,33,39]).
safetyManualUpdate([83,68,14,75,77,76,56,18,13]).
safetyManualUpdate([15,79,35,52,33,16,91,22,41,27,78,63,94,17,98,67,39,18,72,87,55]).
safetyManualUpdate([95,58,72,13,98,35,79,94,55,86,32,52,57,73,12,17,83]).
safetyManualUpdate([67,64,75,22,33,56,55,68,49]).
safetyManualUpdate([63,41,67,15,91,55,17,39,86,72,94,79,98,57,23]).
safetyManualUpdate([57,93,23,53,83,95,85,32,58,14,99,76,77,74,68,47,64,96,49,75,88,56,29]).
safetyManualUpdate([32,58,83,85,72,79,73,87,52]).
safetyManualUpdate([49,75,88,56,29,27,26,18,16,41,67,15,91,22,33,55,17,39,87,52,35]).
safetyManualUpdate([41,39,98,18,16,91,17,33,87,35,55,79,94,73,27,26,63,12,67,15,52]).
safetyManualUpdate([91,17,86,41,72,75,88]).
safetyManualUpdate([91,55,17,52,35,72,12,98,73,57,93,23,53,83,32]).
safetyManualUpdate([88,78,35,33,52,41,15,91,22,39,67,18,56,94,72,55,87,27,29]).
safetyManualUpdate([35,72,79,12,98,57,93,23,83,85,32,58,13,14,99,76,77,68,47]).
safetyManualUpdate([13,74,14,77,83,53,23,47,95,32,96,85,88,56,73,68,57,58,93,76,99]).
safetyManualUpdate([75,58,88,77,99,13,18,96,49,85,68,47,14,64,74,76,16,78,29,63,56]).
safetyManualUpdate([13,68,78,53,76,96,47,58,29,32,85,27,88,64,75]).
safetyManualUpdate([57,83,74,79,32,64,96,13,95,76,14,53,73,85,47,77,98,68,93,94,58,12,99]).
safetyManualUpdate([17,22,35,86,29,39,55,26,91,33,67,75,87,18,16,27,56]).
safetyManualUpdate([78,87,17,29,18,86,41,72,79,63,67,26,55,94,35,39,12,22,91,52,27,33,16]).
safetyManualUpdate([17,87,86,35,72,12,98,73,57,23,53,83,95,85,32,58,13,14,99]).
safetyManualUpdate([58,13,14,99,76,77,74,68,47,64,96,49,75,88,56,29,78,27,18,16,63,41,67]).
safetyManualUpdate([16,76,96,88,78,63,68,13,75,49,32,18,27,74,47,64,58,41,26,99,56,29,77]).
safetyManualUpdate([91,52,41,15,26,72,67,87,18,63,17,73,33]).
safetyManualUpdate([74,68,47,96,49,75,88,56,29,18,16,63,41,55,17]).
safetyManualUpdate([64,26,49,13,77,58,85,74,18,78,96,95,32,14,99,83,76]).
safetyManualUpdate([55,17,39,87,52,35,72,94,79,12,98,73,57,93,23,53,83,95,85,13,14]).
safetyManualUpdate([39,52,35,72,94,79,73,23,53,83,95,32,13,14,76]).
safetyManualUpdate([91,55,17,52,86,72,12,73,53,83,32]).
safetyManualUpdate([99,76,77,74,68,64,96,49,88,56,29,78,26,18,63,41,67,15,91]).
safetyManualUpdate([22,23,35,67,72,94,16,33,55]).
safetyManualUpdate([13,14,76,77,74,64,29,27,26,41,15]).
safetyManualUpdate([12,73,68,96,13,74,76,99,32,14,57,85,53,58,64,47,77,23,49,75,83,98,95]).
