row(1..4).
col(1..4).
val(1..4).

cell(X,Y) :- row(X), col(Y).

subgrid(1,1,1). subgrid(1,2,1). subgrid(1,3,2). subgrid(1,4,2).
subgrid(2,1,1). subgrid(2,2,1). subgrid(2,3,2). subgrid(2,4,2).
subgrid(3,1,3). subgrid(3,2,3). subgrid(3,3,4). subgrid(3,4,4).
subgrid(4,1,3). subgrid(4,2,3). subgrid(4,3,4). subgrid(4,4,4).

sudoku(X,Y,N) :- initial(X,Y,N).
{ sudoku(X,Y,N) : val(N) } = 1 :- cell(X,Y), not initial(X,Y,_).

:- row(X), val(N), { sudoku(X,Y,N) : col(Y) } > 1.
:- row(X), val(N), { sudoku(X,Y,N) : col(Y) } = 0.

:- col(Y), val(N), { sudoku(X,Y,N) : row(X) } > 1.
:- col(Y), val(N), { sudoku(X,Y,N) : row(X) } = 0.

#show subgrid/3.
#show sudoku/3.