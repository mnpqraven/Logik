﻿/* $Id: set_rules.j,v 1.20 2008/05/16 15:58:16 rbornat Exp $ */

RULES "abstraction-I"(A, OBJECT y,OBJECT z) ARE 
        FROM P(A) INFER A∈{ y | P(y) }
    AND FROM P(A,B) INFER <A,B>∈{ <y,z> | P(y,z) }
END

RULES "abstraction-E"(A, OBJECT y, OBJECT z) ARE
        FROM A∈{ y | P(y) } INFER P(A) 
    AND FROM <A,B>∈{ <y,z> | P(y,z) } INFER P(A,B)
END

DERIVED RULE "⊆-I(c)"(OBJECT c) WHERE FRESH c IS FROM c∈A ⊢ c∈B INFER A⊆B
DERIVED RULE "⊆-I(<c,d>)"(OBJECT c,OBJECT d) WHERE FRESH c,d IS FROM <c,d>∈A ⊢ <c,d>∈B INFER A⊆B
DERIVED RULE "=-I" IS FROM A⊆B AND B⊆A INFER A=B
DERIVED RULE "∪-I(L)" IS FROM C∈A INFER C∈A∪B
DERIVED RULE "∪-I(R)" IS FROM C∈B INFER C∈A∪B
DERIVED RULE "∩-I" IS FROM C∈A AND C∈B INFER C∈A∩B
DERIVED RULE "(-)-I" IS FROM C∈A AND C∉B INFER C∈A-B
DERIVED RULE "⁻¹-I" IS FROM ¬(C∈A) INFER C∈A⁻¹
DERIVED RULE "⊆-E"(C) IS FROM C∈A AND A⊆B INFER C∈B
DERIVED RULE "=-E(L)" IS FROM A=B INFER A⊆B
DERIVED RULE "=-E(R)" IS FROM A=B INFER  B⊆A
DERIVED RULE "∪-E" IS FROM C∈A∪B AND C∈A ⊢ P AND C∈B ⊢ P INFER P
DERIVED RULE "∩-E(L)" IS FROM C∈A∩B INFER C∈A
DERIVED RULE "∩-E(R)" IS FROM C∈A∩B INFER C∈B
DERIVED RULE "(-)-E(L)" IS FROM C∈A-B INFER C∈A
DERIVED RULE "(-)-E(R)" IS FROM C∈A-B INFER C∉B
DERIVED RULE "⁻¹-E" IS FROM C∈A⁻¹ INFER ¬(C∈A)
    
RULE "Ø-E" IS FROM A∈Ø INFER ⊥
RULE "A∈U" IS INFER A∈U

DERIVED RULE "singleton" IS INFER A∈{B} ↔ A=B

RULE "= symmetry" IS FROM A=B INFER B=A
RULE "↔ symmetry" IS FROM A↔B INFER B↔A
