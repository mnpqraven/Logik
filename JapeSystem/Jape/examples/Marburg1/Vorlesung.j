/*
    $Id: I2L_LfM-problems.j 506 2011-02-11 10:41:24Z br $

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

TACTIC TheoremForward (thm) IS CUTIN (ALT thm (RESOLVE thm))

TACTIC TheoremForwardOrBackward(thm) IS
    WHEN    
        (LETHYP _A 
            (ALT    (TheoremForward (WITHHYPSEL (WITHARGSEL thm)))))
        (LETHYPS _As
            (Fail ("At present I2L Jape can't deal with multiple hypothesis selections when applying theorems. Sorry.\
                    \\nCancel all but one of them and try again.")))
        (LETGOAL _A
            (ALT (WITHARGSEL thm) 
                (RESOLVE (WITHARGSEL thm)) 
                (TheoremForward (WITHARGSEL thm))
                (Fail   "Theorem application failed -- tell Richard Bornat")))
        (LETOPENSUBGOAL G _A 
            (Fail ("Error in I2L Jape (open subgoal in TheoremForwardOrBackward). Tell Richard Bornat.")))
        (LETOPENSUBGOALS _As
            (ALERT  ("There is more than one unproved conclusion in the proof. Please select one – \
                        \or select a hypothesis – to show \
                        \Jape where to apply the theorem.")
                    ("OK", STOP) 
                    ("Huh?", Explainhypothesisandconclusionwords)))
        (ALERT  "The proof is finished -- there are no unproved conclusions left."
                ("OK", STOP) 
                ("Huh?", Explainunprovedconclusionwords))

/* These theorems are all stated without an explicit left context Γ. That is possible because, in I2L_rules.j,
 * we declared a WEAKEN structure rule: Jape will automatically discard any unmatched left-context
 * formulae.
 */
  
/* Panels are declared in reverse order because the GUIs,  quite reasonably, create panels in the order requested.
 * Thus the last you ask for is the last created, and appears at the front of the stack.
 */


CONJECTUREPANEL "Prädikatenlogik"
    /* Beispiele in der Vorlesung */
    THEOREM IS ∀x.(Q(x) → R(x)), ∃y.(P(y) ∧ Q(y)) ⊢ ∃z.(P(z) ∧ R(z))
	/* kommen weiter unten
	THEOREM IS ¬∀x.P(x) ⊢ ∃x.¬P(x)
  	THEOREM IS (∃x.P(x)) ∨ (∃x.Q(x)) ⊢ ∃x.(P(x) ∨ Q(x))
	*/
	
	/* Gesetze der Prädikatenlogik */
	THEOREM IS ¬∀x.P(x) ⊢ ∃x.¬P(x)
	THEOREM IS ∃x.¬P(x) ⊢ ¬∀x.P(x)
	THEOREM IS ¬∃x.P(x) ⊢ ∀x.¬P(x)
	THEOREM IS ∀x.¬P(x) ⊢ ¬∃x.P(x)
	
	THEOREM IS ∀x.P(x) ∧ ∀x.Q(x) ⊢ ∀x.(P(x) ∧ Q(x))
	THEOREM IS ∀x.(P(x) ∧ Q(x)) ⊢ ∀x.P(x) ∧ ∀x.Q(x)
	
	THEOREM IS ∃x.P(x) ∨ ∃x.Q(x) ⊢ ∃x.(P(x) ∨ Q(x))
	THEOREM IS ∃x.(P(x) ∨ Q(x)) ⊢ ∃x.P(x) ∨ ∃x.Q(x)
	
	THEOREM IS ∀x.P(x) ∨ ∀x.Q(x) ⊢ ∀x.(P(x) ∨ Q(x))
	THEOREM IS ∃x.(P(x) ∧ Q(x)) ⊢ ∃x.P(x) ∧ ∃x.Q(x)
	
	/* Übungen */
	THEOREM IS ∀x.∀y.P(x,y) ⊢ ∀u.∀v.P(u,v)
	THEOREM IS ∃x.∃y.F(x,y) ⊢ ∃u.∃v.F(u,v)
	THEOREM IS ∃x.∀y.P(x,y) ⊢ ∀y.∃x.P(x,y)
	THEOREM IS ∃x.(S → Q(x)) ⊢ S → ∃x.Q(x)
	THEOREM IS ¬∀x.¬P(x) ⊢ ∃x.P(x)
	THEOREM IS ∃x.P(x) ⊢ ¬∀x.¬P(x)
	THEOREM IS S → ∀x.Q(x) ⊢ ∀x.(S → Q(x))
	THEOREM IS ∀y.∃x.∀x'.(R(x',x) → F(x',y)), ∀z.∃y.∀y'.(R(y',y) → G(y',z)) ⊢ ∀z.∃x.∀x'.(R(x',x) → ∃u.(F(x',u)∧G(u,z)))
	
    BUTTON Apply IS apply TheoremForwardOrBackward COMMAND
END
CONJECTUREPANEL "Aussagenlogik"
	THEOREM IS P → (P → Q) → Q
	THEOREM IS P → (Q → P)
	THEOREM IS P ⊢ (P → Q) → P
	THEOREM IS (P → Q) → (Q → R) → (P → R)
	THEOREM IS Q → R ⊢ (P → Q) → (P → R)
	
	THEOREM IS (P ∧ Q) → P

	THEOREM IS P → (Q → R) ⊢ (P ∧ Q) → R
	THEOREM IS P ∧ Q ⊢ Q ∧ P
	THEOREM IS (P ∧ Q) ∧ R ⊢ P ∧ (Q ∧ R)
	THEOREM IS (P ∧ Q) ∧ R, S ∧ T ⊢ Q ∧ S


	THEOREM IS (P ∧ Q) → R ⊢ P → Q → R
	THEOREM IS (P → R) ∧ (Q → R) ⊢ P ∧ Q → R
	THEOREM IS P → Q, R → S ⊢ P ∧ R → Q ∧ S
	THEOREM IS P → Q ∧ R ⊢ (P → Q) ∧ (P → R)

	THEOREM IS Q → (P → R), ¬R, Q ⊢ ¬P 

	THEOREM IS P ∨ (P ∧ Q) ⊢ P
	THEOREM IS (P ∨ (Q → P)) ∧ Q ⊢ P
	THEOREM IS (P ∧ Q) ∨ (P ∧ R) ⊢ P ∧ (Q ∨ R) 
	THEOREM IS P → Q, R → S ⊢ P ∨ R → Q ∨ S

	THEOREM IS P ⊢ ¬¬P
	THEOREM IS P → Q, ¬Q ⊢ ¬P
	THEOREM IS P → Q ⊢ ¬Q → ¬P
	
	/* De Morgan */
	THEOREM IS ¬P ∨ ¬Q → ¬(P ∧ Q)  
	THEOREM IS ¬(P ∨ Q) → ¬P ∧ ¬Q  
	THEOREM IS ¬P ∧ ¬Q → ¬(P ∨ Q)  
	
	/* Benötigen Widerspruchbeweise */
	
	THEOREM IS ¬(P ∧ Q) → (¬P ∨ ¬Q)  
	
	THEOREM IS ¬¬P ⊢ P
	THEOREM IS P ∨ ¬P
	THEOREM IS P → Q, ¬P → Q ⊢ Q

	/* Peirce's law */
	THEOREM IS ((P → Q) → P) → P
	
    BUTTON Apply IS apply TheoremForwardOrBackward COMMAND
END
