row(1..9).
col(1..9).
num(1..9).

cell(X,Y) :- row(X), col(Y).

sub(1,X,Y) :- X=1..3, Y=1..3.
sub(2,X,Y) :- X=1..3, Y=4..6.
sub(3,X,Y) :- X=1..3, Y=7..9.

sub(4,X,Y) :- X=4..6, Y=1..3.
sub(5,X,Y) :- X=4..6, Y=4..6.
sub(6,X,Y) :- X=4..6, Y=7..9.

sub(7,X,Y) :- X=7..9, Y=1..3.
sub(8,X,Y) :- X=7..9, Y=4..6.
sub(9,X,Y) :- X=7..9, Y=7..9.

sudoku(X,Y,N) :- initial(X,Y,N).

{ sudoku(X,Y,N) : num(N) } = 1 :- cell(X,Y), not initial(X,Y,_).

:- row(X), num(N), { sudoku(X,Y,N) : col(Y) } > 1.
:- row(X), num(N), { sudoku(X,Y,N) : col(Y) } = 0.

:- col(Y), num(N), { sudoku(X,Y,N) : row(X) } > 1.
:- col(Y), num(N), { sudoku(X,Y,N) : row(X) } = 0.

:- G=1..9, num(N), { sudoku(X,Y,N) : sub(G,X,Y) } > 1.
:- G=1..9, num(N), { sudoku(X,Y,N) : sub(G,X,Y) } = 0.

#show sudoku/3.