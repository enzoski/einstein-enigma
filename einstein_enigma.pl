% ENTIDADES RELEVANTES
% --------------------
% Tenemos 5 casas con caracteristicas diferentes.
% casa(Color,Nacionalidad,Bebida,Cigarrillos,Mascota)
% Ademas cada casa esta ubicada en una posicion concreta.
%
solucion(C):- C = casas(C1,C2,C3,C4,C5),
              X1 = casa(    roja, britanico,       _,           _,       _), posicion(X1,C),
              X2 = casa(       _,     sueco,       _,           _,   perro), posicion(X2,C),
              X3 = casa(       _,     danes,      te,           _,       _), posicion(X3,C),
              X4 = casa(   verde,         _,    cafe,           _,       _), izquierdaBlanca(X4,casa(blanca,_,_,_,_),C),
              X5 = casa(       _,         _,       _,    pallmall,  pajaro), posicion(X5,C),
              X6 = casa(amarilla,         _,       _,     dunhill,       _), posicion(X6,C),
              X7 = casa(       _,         _,   leche,           _,       _), centro(X7,C),
              X8 = casa(       _,   noruego,       _,           _,       _), primero(X8,C), vecino(X8,casa(azul,_,_,_,_),C),
              X9 = casa(       _,         _,       _,      brends,       _), vecino(X9,casa(_,_,_,_,gato),C), vecino(X9,casa(_,_,agua,_,_),C),
              X10 = casa(      _,         _,       _,           _, caballo), vecino(X10,casa(_,_,_,dunhill,_),C),
              X11 = casa(      _,         _, cerveza, bluemasters,       _), posicion(X11,C),
              X12 = casa(      _,    aleman,       _,      prince,       _), posicion(X12,C).
%
% RESTRICCIONES
% -------------
primero(X,casas(X,_,_,_,_)).
centro(X,casas(_,_,X,_,_)).
%
izquierdaBlanca(X,Y,casas(X,Y,_,_,_)).
izquierdaBlanca(X,Y,casas(_,X,Y,_,_)).
izquierdaBlanca(X,Y,casas(_,_,X,Y,_)).
izquierdaBlanca(X,Y,casas(_,_,_,X,Y)).
%
vecino(X,Y,casas(X,Y,_,_,_)).
vecino(X,Y,casas(Y,X,_,_,_)).
vecino(X,Y,casas(_,X,Y,_,_)).
vecino(X,Y,casas(_,Y,X,_,_)).
vecino(X,Y,casas(_,_,X,Y,_)).
vecino(X,Y,casas(_,_,Y,X,_)).
vecino(X,Y,casas(_,_,_,X,Y)).
% ---------------------------
% Los que usan este predicado, quiere decir que no tienen un restriccion
% directa de su posicion, pero tienen que estar en algun lado.
posicion(X,casas(X,_,_,_,_)).
posicion(X,casas(_,X,_,_,_)).
posicion(X,casas(_,_,X,_,_)).
posicion(X,casas(_,_,_,X,_)).
posicion(X,casas(_,_,_,_,X)).
%----------------------------
%
% Nota: originalmente el problema no dice nada acerca del pececito, por
% lo que en la solucion queda una casa cuyo animal no está instanciado.
% Esa casa, es la solucion del problema.
% En solucionTotal(S), buscara justamente la unica casa que haga
% match con 'pecesito', obviamente no hay ninguna que tenga ese animal,
% pero la variable no instanciada sí matchea, y esa sería la casa.
%
solucionTotal(S):-solucion(C),
                  X = casa(_,D,_,_,pececito),
                  posicion(X,C),%busco en que casa está el pecesito, y las variables anonimas se instancian con esos valores.
                  S = duenio(D,X).
