;==============================================================================
; display7seg.inc  -  Multiplexado de dos dígitos de 7 segmentos (cátodo común)
;
; Entrada:  SEGUNDOS (0..99)
; Salida:   PORTD = segmentos,  RC0/RC1 = ánodos
;
; MOSTRAR_CUENTA refresca los dos dígitos durante aproximadamente 1 segundo:
; 100 barridos de 5 ms por dígito.
;==============================================================================

MOSTRAR_CUENTA
    CALL    SEPARAR_DIGITOS
    MOVLW   .100
    MOVWF   CONT_2

BARRIDO
    ; --- dígito de las decenas ---
    BANKSEL PORTC
    BCF     PORTC, 1
    MOVF    DECENAS, W
    CALL    TABLA_7SEG
    MOVWF   PORTD
    BSF     PORTC, 0
    CALL    RETARDO_5MS

    ; --- dígito de las unidades ---
    BCF     PORTC, 0
    MOVF    UNIDADES, W
    CALL    TABLA_7SEG
    MOVWF   PORTD
    BSF     PORTC, 1
    CALL    RETARDO_5MS

    DECFSZ  CONT_2, F
    GOTO    BARRIDO

    BCF     PORTC, 0
    BCF     PORTC, 1
    RETURN

;------------------------------------- separa SEGUNDOS en decenas y unidades
SEPARAR_DIGITOS
    CLRF    DECENAS
    MOVF    SEGUNDOS, W
    MOVWF   UNIDADES
RESTAR_10
    MOVLW   .10
    SUBWF   UNIDADES, W
    BTFSS   STATUS, C
    RETURN
    MOVWF   UNIDADES
    INCF    DECENAS, F
    GOTO    RESTAR_10

;--------------------------------------------- tabla de segmentos  .gfedcba
TABLA_7SEG
    ADDWF   PCL, F
    RETLW   b'00111111'     ; 0
    RETLW   b'00000110'     ; 1
    RETLW   b'01011011'     ; 2
    RETLW   b'01001111'     ; 3
    RETLW   b'01100110'     ; 4
    RETLW   b'01101101'     ; 5
    RETLW   b'01111101'     ; 6
    RETLW   b'00000111'     ; 7
    RETLW   b'01111111'     ; 8
    RETLW   b'01101111'     ; 9
