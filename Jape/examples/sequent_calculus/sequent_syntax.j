﻿/* $Id: sequent_syntax.j,v 1.8 2004/05/27 09:42:58 richard Exp $ */

INITIALISE interpretpredicates true

INITIALISE displaystyle tree

CLASS BAG Γ ∆
CLASS FORMULA A B C D P Q R S
CLASS VARIABLE u v w x y z m n

LEFTFIX 20              ∀ .
LEFTFIX 20              ∃ .

INFIX           100L            ≡
INFIX           110R            →
INFIX           150L            ∧
INFIX           160L            ∨
PREFIX  200             ¬
JUXTFIX 300
SUBSTFIX        400 

BIND    x SCOPE P IN ∃x . P
BIND    x SCOPE P IN ∀x . P
