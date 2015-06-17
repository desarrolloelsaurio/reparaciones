FUNCTION memo2string(memovar)
    PRIVATE cErgebnis as String
    
    cErgebnis = ""
        
    FOR i=0 TO MEMLINES(memovar)
        cErgebnis = cErgebnis + " " + ALLTRIM(MLINE(memovar, i))
    ENDFOR
    
    RETURN cErgebnis
ENDFUNC