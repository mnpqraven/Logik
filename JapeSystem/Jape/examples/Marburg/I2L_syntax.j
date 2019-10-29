﻿/*
    $Id: I2L_syntax.j 506 2011-02-11 10:41:24Z br $

    Copyright (C) 2000-8 Richard Bornat
     
        richard@bornat.me.uk

    This file is part of the I2L logic encoding, distributed with jape.

    Jape is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    Jape is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with jape; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
    (or look at http://www.gnu.org).

*/

CLASS VARIABLE  a x x' y y' z z'
                x0 y0 z0 i j k
				u v w
				chomsky
/* br: Q hinzugefuegt
*/
CLASS FORMULA   A B C D  
                E F G H  
                P Q  
                R S T
				ling compling kennt
CLASS BAG FORMULA Γ

CONSTANT ⊥ ⊤

PREFIX  10  actual

INFIX   100R    →
INFIX   120L    ∨
INFIX   140L    ∧

PREFIX  200 ¬

LEFTFIX 200 ∀ .
LEFTFIX 200 ∃ .

JUXTFIX 300
SUBSTFIX    400 

BIND x SCOPE A IN ∀x . A
BIND x SCOPE B IN ∃x . B

SEQUENT IS BAG ⊢ FORMULA

INITIALISE autoAdditiveLeft     true /* allow rules to be stated without an explicit left context */
INITIALISE interpretpredicates  true /* allow predicate syntax ... */
