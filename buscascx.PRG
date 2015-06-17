buscado = "USE"
cuantos=ADIR(eldire, "*.scx")
FOR a=1 TO ALEN(eldire,1)
	USE (eldire(a,1)) ALIAS pan SHARED 
	IF !EMPTY(AT(buscado, pan.methods))
		? pan.class, pan.objname
	ENDIF 
NEXT 
CLOSE DATABASES
