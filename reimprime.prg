=opbase("personas")
*!*	SELECT personas
*!*	SET ORDER TO CODCLI   && CODCLI
*!*	SELECT DISTINCT codcli, cliente FROM personas INTO TABLE curperso WHERE filtro = "C" AND !DELETED()

=opbase("mercarep")
=opbase("repara")
=opbase("tipomovi")
=opbase("movirepa")
=opbase("mercarep")
=opbase("mixta")

larepara = VAL(INPUTBOX("Numero de reparacion", "Impresion", "0"))
DO WHILE !EMPTY(larepara)

	m.elvende = eliven()

	m.laentrega = "En un lapso no menor a 7 días hábiles comuniquese para saber si su orden a sido evaluada por el tecnico"
	m.lagarantia = "Garantia de los productos reparados: La garantia de la reparacion es de 3 meses desde la fecha de reparacion"

	SELECT REPARA
	=SEEK(LAREPARA, "REPARA", "IDREPARA") 	
	SCATTER MEMVAR MEMO 

	SELECT PERSONAS
	=SEEK(M.CODCLI, "PERSONAS", "CODCLI")
	SCATTER MEMVAR 
	STORE PERSONAS.TEXTO3 TO M.EMAIL

	SELECT MERCAREP
	=SEEK(M.ARTICULO, "MERCAREP", "ARTICULO")
	SCATTER MEMVAR MEMO 
	STORE MERCAREP.MERCA TO M.PRODUCTO

	SELECT MIXTA
	=SEEK(LOCALIDAD, "MIXTA", "CIUCOD")
	STORE MIXTA.TEXTO1 TO M.CIUDAD 
			
	REPORT FORM recibo  RANGE 1,1  TO PRINTER PROMPT NOCONSOLE 

	larepara = VAL(INPUTBOX("Numero de reparacion", "Impresion", "0"))

ENDDO 