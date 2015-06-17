function eliven
=opbase("vendedor")
	do while .T.
		respuesta = INPUTBOX("Codigo:", "VENDEDOR")
		IF !EMPTY(respuesta)
			IF  SEEK(ALLTRIM(respuesta),"VENDEDOR", "CODIGO")
				EXIT
			ELSE
				wait "CODIGO EQUIVOCADO !!, REINGRESE" nowa wind
			ENDIF
		ENDIF
	ENDDO
RETURN VENDEDOR.nombre
