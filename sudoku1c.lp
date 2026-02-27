row(1..4).
col(1..4).
num(1..4).

cell(X,Y) :- row(X), col(Y).

% subgrid mapping (2x2 blocks)
sub(1,X,Y) :- X=1..2, Y=1..2.
sub(2,X,Y) :- X=1..2, Y=3..4.
sub(3,X,Y) :- X=3..4, Y=1..2.
sub(4,X,Y) :- X=3..4, Y=3..4.

% keep givens
sudoku(X,Y,N) :- initial(X,Y,N).

% every cell gets exactly one number (if not given)
{ sudoku(X,Y,N) : num(N) } = 1 :- cell(X,Y), not initial(X,Y,_).

% rows must contain each number exactly once
:- row(X), num(N), { sudoku(X,Y,N) : col(Y) } > 1.
:- row(X), num(N), { sudoku(X,Y,N) : col(Y) } = 0.

% columns must contain each number exactly once
:- col(Y), num(N), { sudoku(X,Y,N) : row(X) } > 1.
:- col(Y), num(N), { sudoku(X,Y,N) : row(X) } = 0.

% subgrids must contain each number exactly once
:- G=1..4, num(N), { sudoku(X,Y,N) : sub(G,X,Y) } > 1.
:- G=1..4, num(N), { sudoku(X,Y,N) : sub(G,X,Y) } = 0.

#show sudoku/3.