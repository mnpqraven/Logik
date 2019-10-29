﻿/* $Id: debug\040file\040and\040settings.j,v 1.10 2004/07/01 10:44:40 richard Exp $ */

/* everybody gets these */
UMENU File IS
    SEPARATOR
    BUTTON "Debug output to ..." IS createdbugfile
    BUTTON "Close debug file"    IS closedbugfile
    
    SEPARATOR
    
    CHECKBOX tactictracing  "trace tactics"
    CHECKBOX unifydebug     "trace unification"
    CHECKBOX rewritedebug   "trace rewrites"
    CHECKBOX substdebug     "trace substitution simplification"
    CHECKBOX factsdebug     "trace substitution use of provisos etc."
    CHECKBOX provisodebug   "trace proviso simplification"
    CHECKBOX thingdebug     "trace rule/theorem/tactic store/retrieve"
    CHECKBOX symboldebug    "trace lexical analysis"
    CHECKBOX termparsedebug "trace syntax analysis"
    
    SEPARATOR
        
    RADIOBUTTON applydebug IS
            "don't trace rule/theorem application"  IS "0"
    AND     "basic trace rule/theorem application"  IS "1"
    AND     "full trace rule/theorem application"   IS "2"
    INITIALLY "0"
    END
END

/* individual proofs get these */
MENU File IS
    SEPARATOR
    
    CHECKBOX showallprovisos    "show all provisos"
    CHECKBOX showallproofsteps  "show all proof steps"
    CHECKBOX hidecut            "hide cuts"
    CHECKBOX hidehyp            "hide identity lines"

END
