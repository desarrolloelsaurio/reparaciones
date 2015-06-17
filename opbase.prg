FUNCTION opbase
PARAMETERS cualbase
IF !USED(cualbase)
	USE (elcamino+cualbase) SHARED IN 0
ENDIF  
SELECT (cualbase)
RETURN 
