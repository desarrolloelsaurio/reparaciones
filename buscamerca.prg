FUNCTION buscamerca
IF EMPTY(repara.articulo)
	=SEEK(repara.artic, "merca","artic")
	sale = merca.merca
ELSE
	=SEEK(repara.articulo, "mercarep","articulo")
	sale = mercarep.merca
ENDIF
RETURN sale

