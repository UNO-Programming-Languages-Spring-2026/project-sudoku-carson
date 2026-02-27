row(1..4).
col(1..4).
val(1..4).

cell(X,Y) :- row(X), col(Y).

sudoku(X,Y,N) :- initial(X,Y,N).

{ sudoku(X,Y,N) : val(N) } = 1 :- cell(X,Y), not initial(X,Y,_).

:- row(X), val(N), { sudoku(X,Y,N) : col(Y) } > 1.
:- row(X), val(N), { sudoku(X,Y,N) : col(Y) } = 0.

:- col(Y), val(N), { sudoku(X,Y,N) : row(X) } > 1.
:- col(Y), val(N), { sudoku(X,Y,N) : row(X) } = 0.

#show sudoku/3.