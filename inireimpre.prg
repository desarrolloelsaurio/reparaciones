PROCEDURE inireimpre
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
***DO FORM menureimp
DO reimprime