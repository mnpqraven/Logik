a.
close(Pfad,Lits)
Die Klauseln in Zeilen 34, 35, 36 behandeln den Fall wenn das erste Element L von Pfad (der aktuelle Knoten im Baum) keine nicht-atomare Formel, sondern ein Literal ist.
Zeile 34: Falls (und da) L schon ein Element von Lits (die Liste der bekannten Literalen) ist, muss einfach nur close() mit den Restknoten von Pfad und der gleichen Lits aufgerufen werden.
Zeile 35: Falls L kein Element von Lits aber negierte L ist, und weil das erste Element von Pfad (der aktuelle Knoten) L ist, ist dieser Ast (Pfad) im Baum unerfüllbar und somit geschlossen, daher kein rekursiver Aufruf von close().
Zeile 36: Falls L und negierte L gleichzeitig nicht in Lits sind, muss L zu der Liste der bekannten Literalen Lits hinzugefügt werden und der aktuelle Pfad ist weiter zu traversieren, daher rekursiver Aufruf von close() mit den Restknoten von Pfad und der neuen Lits, die jetzt L enthält.

Wenn die Reihenfolge geändert würde, würde die oben beschriebene Logik hinter der Fallunterscheidung und dem Tableaukalkül verletzt und es könnte zu falschen Fälle führen, bspw. der Fall wenn L und negierte L gleichtzeitig in Lits sind trotzdem close() wird immer noch aufgerufen (d.h. der Pfad ist NICHT geschlossen).

b.
op(110,yfx, "<->"). % yfx steht für linksassoziativ, 110 ist niedrigste Präzedenz

% Die alpha-Regeln

close([ A <-> B | Rest], Lits) :- !, close([ A -> B, B -> A | Rest], Lits).

% Die beta-Regeln

close([ ~(A <-> B) | Rest], Lits) :- !, close([ ~(A -> B) | Rest], Lits), close([ ~(B -> A) | Rest], Lits).

Zum Testen: close([(a<->b)<->( ~ a<-> ~ b)],[]).

