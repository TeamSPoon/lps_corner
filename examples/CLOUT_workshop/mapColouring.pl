
maxTime(5).

if country(X)
then
    colour(C),
    paint(X,C) from T1 to T2.

false
    paint(X,C),
    adjacent(X,Y),
    paint(Y,C).

false
    paint(X,C) from T1,
    adjacent(X,Y),
    painted(Y,C) at T1.

country(iz).
country(oz).
country(az).
country(uz).

colour(red).
colour(yellow).
colour(blue).

adjacent(az,iz).
adjacent(az,oz).
adjacent(iz,oz).
adjacent(iz,uz).
adjacent(oz,uz).

actions paint(_,_).
fluents painted(_G2000,_G2001).

paint(X, C) initiates painted(X,C).

/** <examples>
?- go(Timeline).
*/