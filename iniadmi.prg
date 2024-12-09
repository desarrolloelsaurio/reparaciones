PROCEDURE iniADMI
SET SAFETY OFF 
SET EXCLUSIVE OFF
SET CENTURY OFF
SET TALK ON 
SET DATE BRITISH  
SET DELETED ON 

_Screen.WindowState = 2

************    carga la config
confname = SYS(5) + SYS(2003)+"\repara.ini"
IF !FILE(confname)
	=MESSAGEBOX("Falta configuracion..",48,"ERROR")
	CANCEL
ENDIF 
Handler = FOPEN(confname)
lalin = FGETS(Handler)
FCLOSE(Handler)

PUBLIC usuario_admin
usuario_admin = (LEFT(lalin,1) = "H")
PUBLIC elcamino
elcamino=SUBSTR(lalin,2)

=opbase("personas")
*!*	SELECT personas
*!*	SET ORDER TO CODCLI   && CODCLI
*!*	SELECT DISTINCT codcli, cliente FROM personas INTO TABLE curperso WHERE filtro = "C" AND !DELETED()

=opbase("mercarep")
=opbase("repara")
=opbase("tipomovi")
=opbase("movirepa")
=opbase("merca")
=opbase("mixta")


larepara = VAL(INPUTBOX("Numero de reparacion", "Impresion", "0"))
IF EMPTY(larepara)
	RETURN 
ENDIF 

m.elvende = eliven()

m.laentrega = "En un lapso no mayor a 5 días hábiles nos comunicaremos para comunicar el presupuesto"
m.lagarantia = "Garantia de los productos reparados: Todas las reparaciones tendrán una garantía de 30 días a partir de la fecha de entrega"

SELECT REPARA
=SEEK(LAREPARA, "REPARA", "IDREPARA") 	
SCATTER MEMVAR MEMO 

SELECT PERSONAS
=SEEK(M.CODCLI, "PERSONAS", "CODCLI")
SCATTER MEMVAR 
STORE PERSONAS.TEXTO3 TO M.EMAIL

SELECT MERCAREP
=SEEK(M.ARTICULO, "MERCA", "ARTICULO")
SCATTER MEMVAR MEMO 
STORE MERCA.MERCA TO M.PRODUCTO

SELECT MIXTA
=SEEK(LOCALIDAD, "MIXTA", "CIUCOD")
STORE MIXTA.TEXTO1 TO M.CIUDAD 
		
REPORT FORM recibo  RANGE 1,1  TO PRINTER PROMPT NOCONSOLE 

