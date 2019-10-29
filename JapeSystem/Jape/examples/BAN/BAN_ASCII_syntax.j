﻿/* $Id: BAN_ASCII_syntax.j,v 1.6 2004/05/27 09:39:06 richard Exp $ */

CLASS VARIABLE x k
CLASS FORMULA W X Y Z
CLASS CONSTANT P Q R K N T
CONSTANT A B S


SUBSTFIX    700
JUXTFIX     600
PREFIX      500     #
POSTFIX     500     ⁻¹
INFIX       300L        ⇌  ↦ ↔
INFIX       200R        |~
INFIX       150R        |⇒
LEFTFIX     110 ∀ .
INFIX       100R        |≡
INFIX       50L <|

OUTFIX {  }
OUTFIX <  >


BIND x SCOPE P IN ∀x . P

SEQUENT IS BAG ⊢ FORMULA

INITIALISE autoAdditiveLeft true /* allow rules to be stated without an explicit left context */
