;==============================================================================
; retardos.inc  -  Retardos por software para 4 MHz (1 ciclo = 1 us)
;
; Nota del equipo: son retardos bloqueantes. Cuando se agregue el pulsador
; peatonal hay que pasarlos a TMR0, si no el pulsador no responde durante la
; cuenta. Está discutido en el issue #10.
;==============================================================================

RETARDO_5MS
    MOVLW   .6
    MOVWF   CONT_1
LAZO_EXT
    MOVLW   .207
    MOVWF   AUX_W
LAZO_INT
    NOP
    DECFSZ  AUX_W, F
    GOTO    LAZO_INT
    DECFSZ  CONT_1, F
    GOTO    LAZO_EXT
    RETURN

RETARDO_100MS
    MOVLW   .20
    MOVWF   CONT_2
LAZO_100
    CALL    RETARDO_5MS
    DECFSZ  CONT_2, F
    GOTO    LAZO_100
    RETURN
