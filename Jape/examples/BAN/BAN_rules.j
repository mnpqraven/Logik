﻿/* $Id: BAN_rules.j,v 1.15 2008/01/19 10:26:48 rbornat Exp $ */

RULE "P⫢(Q,P)↔K, P◃{X}K ⇒ P⫢Q⇝X" IS FROM P⫢(Q,P)↔K AND P◃{X}K INFER P⫢Q⇝X
RULE "P⫢Q↦K, P◃{X}K⁻¹ ⇒ P⫢Q⇝X" IS FROM P⫢Q↦K AND P◃{X}K⁻¹ INFER P⫢Q⇝X
RULE "P⫢(P,Q)⇌Y, P◃<X>Y ⇒ P⫢Q⇝X" IS FROM P⫢(P,Q)⇌Y AND P◃<X>Y INFER P⫢Q⇝X
RULE "P⫢#X, P⫢Q⇝X ⇒ P⫢Q⫢X" IS FROM P⫢#X AND P⫢Q⇝X INFER P⫢Q⫢X
RULE "P⫢Q⤇X, P⫢Q⫢X ⇒ P⫢X" IS FROM P⫢Q⤇X AND P⫢Q⫢X INFER P⫢X
RULES "P⫢X,  P⫢Y,  ... ⇒ P⫢(X,Y,...)" ARE
    FROM P⫢X AND P⫢Y INFER P⫢(X,Y)
 AND    FROM P⫢X AND P⫢Y AND P⫢Z INFER P⫢(X,Y,Z)
 AND    FROM P⫢W AND P⫢X AND P⫢Y AND P⫢Z INFER P⫢(W,X,Y,Z)
END
RULES "P⫢(...,X,...) ⇒ P⫢X"(X) ARE 
    FROM P⫢(X,Y) INFER P⫢X
 AND    FROM P⫢(Y,X) INFER P⫢X
 AND    FROM P⫢(X,Y,Z) INFER P⫢X
 AND    FROM P⫢(Z,X,Y) INFER P⫢X
 AND    FROM P⫢(Y,Z,X) INFER P⫢X
 AND    FROM P⫢(X,Y,Z,W) INFER P⫢X
 AND    FROM P⫢(W,X,Y,Z) INFER P⫢X
 AND    FROM P⫢(Z,W,X,Y) INFER P⫢X
 AND    FROM P⫢(Y,Z,W,X) INFER P⫢X
END
RULES "P⫢Q⫢(...,X,...) ⇒ P⫢Q⫢X"(X) ARE 
    FROM P⫢Q⫢(X,Y) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(Y,X) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(X,Y,Z) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(Z,X,Y) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(Y,Z,X) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(X,Y,Z,W) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(W,X,Y,Z) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(Z,W,X,Y) INFER P⫢Q⫢X
 AND    FROM P⫢Q⫢(Y,Z,W,X) INFER P⫢Q⫢X
END
RULES "P⫢Q⇝(...,X,...) ⇒ P⫢Q⇝X"(X) ARE
    FROM P⫢Q⇝(X,Y) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(Y,X) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(X,Y,Z) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(Z,X,Y) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(Y,Z,X) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(X,Y,Z,W) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(W,X,Y,Z) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(Z,W,X,Y) INFER P⫢Q⇝X
 AND    FROM P⫢Q⇝(Y,Z,W,X) INFER P⫢Q⇝X
END
RULES "P◃(...,X,...) ⇒ P◃X"(X) ARE 
    FROM P◃(X,Y) INFER P◃X
 AND    FROM P◃(Y,X) INFER P◃X
 AND    FROM P◃(X,Y,Z) INFER P◃X
 AND    FROM P◃(Z,X,Y) INFER P◃X
 AND    FROM P◃(Y,Z,X) INFER P◃X
 AND    FROM P◃(X,Y,Z,W) INFER P◃X
 AND    FROM P◃(W,X,Y,Z) INFER P◃X
 AND    FROM P◃(Z,W,X,Y) INFER P◃X
 AND    FROM P◃(Y,Z,W,X) INFER P◃X
END
RULE "P◃<X>Y ⇒ P◃X" IS FROM P◃<X>Y INFER P◃X
RULE "P⫢(P,Q)↔K, P◃{X}K ⇒ P◃X" IS FROM P⫢(P,Q)↔K AND P◃{X}K INFER P◃X
RULE "P⫢P↦K, P◃{X}K ⇒ P◃X" IS FROM P⫢P↦K AND P◃{X}K INFER P◃X
RULE "P⫢Q↦ K, P◃{X}K⁻¹ ⇒ P◃X" IS FROM P⫢Q↦ K AND P◃{X}K⁻¹ INFER P◃X
RULES "P⫢#X ⇒ P⫢#(...,X,...)"(X) ARE
    FROM P⫢#X INFER P⫢#(X,Y)
 AND    FROM P⫢#X INFER P⫢#(Y,X)
 AND    FROM P⫢#X INFER P⫢#(X,Y,Z)
 AND    FROM P⫢#X INFER P⫢#(Z,X,Y)
 AND    FROM P⫢#X INFER P⫢#(Y,Z,X)
 AND    FROM P⫢#X INFER P⫢#(X,Y,Z,W)
 AND    FROM P⫢#X INFER P⫢#(W,X,Y,Z)
 AND    FROM P⫢#X INFER P⫢#(Z,W,X,Y)
 AND    FROM P⫢#X INFER P⫢#(Y,ZW,X)
END
RULE "P⫢(R,R')↔K ⇒ P⫢(R',R)↔K" IS FROM P⫢(R,R')↔K INFER P⫢(R',R)↔K
RULE "P⫢Q⫢(R,R')↔K ⇒ P⫢Q⫢(R',R)↔K" IS FROM P⫢Q⫢(R,R')↔K INFER P⫢Q⫢(R',R)↔K
RULE "P⫢(R,R')⇌K ⇒ P⫢(R',R)⇌K" IS FROM P⫢(R,R')⇌K INFER P⫢(R',R)⇌K
RULE "P⫢Q⫢(R,R')⇌K ⇒ P⫢Q⫢(R',R)⇌K" IS FROM P⫢Q⫢(R,R')⇌K INFER P⫢Q⫢(R',R)⇌K    

/* I hope we can use hyp, else a sequent presentation is impossible; I' m sure that we can use cut */
RULE hyp IS INFER X ⊢ X
RULE cut(X) IS FROM X AND X ⊢ Y INFER Y
    
IDENTITY hyp
CUT cut

/* I think we have weakening.  I hope we do, because otherwise theorem application is difficult */
RULE weaken(X) IS FROM Y INFER X ⊢ Y
WEAKEN weaken

RULE "P⫢∀x.X(x) ⇒ P⫢X(Y)"(Y,ABSTRACTION X) IS FROM P⫢∀x.X(x) INFER P⫢X(Y)

