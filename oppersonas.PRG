FUNCTION oppersonas
IF !USED("personas")
	USE (elcamino+"personas") SHARED IN 0
ENDIF  
SELECT ("personas")
RETURN 
