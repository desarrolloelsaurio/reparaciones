PROCEDURE inirepara
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
SET DELETED ON 

lalin = FGETS(Handler)
FCLOSE(Handler)

PUBLIC usuario_admin, BsAs
usuario_admin = (LEFT(lalin,1) = "H")
BsAs = (LEFT(lalin,1) = "G")
PUBLIC elcamino
elcamino=SUBSTR(lalin,2)

=opbase("personas")
SELECT personas
SET ORDER TO CODCLI   
SELECT DISTINCT codcli, cliente FROM personas INTO TABLE curperso WHERE filtro = "C" AND !DELETED()

=opbase("mercarep")
=opbase("merca")
DO FORM principal