;==============================================================================
; main.asm  -  Semáforo vehicular con cuenta regresiva
; Electrónica Digital II  -  PIC16F887 @ 4 MHz (XT)
;
; Salidas:
;   RB0 -> LED rojo        RD0..RD6 -> segmentos a..g del display
;   RB1 -> LED amarillo    RC0      -> ánodo del dígito de las decenas
;   RB2 -> LED verde       RC1      -> ánodo del dígito de las unidades
;
; Entradas:
;   RA0 -> pulsador de cruce peatonal  (todavía no implementado, ver issue #4)
;==============================================================================

    LIST      P=16F887
    #INCLUDE  <P16F887.INC>
    #INCLUDE  "inc/config.inc"

;------------------------------------------------------------------ variables
    CBLOCK  0x20
        SEGUNDOS        ; cuenta regresiva de la fase actual
        FASE            ; 0 = verde, 1 = amarillo, 2 = rojo
        DECENAS
        UNIDADES
        AUX_W
        AUX_STATUS
        CONT_1
        CONT_2
    ENDC

; Duración de cada fase, en segundos.
; TODO: pasarlas a EEPROM para poder cambiarlas sin recompilar (issue #2)
T_VERDE     EQU  .20
T_AMARILLO  EQU  .3
T_ROJO      EQU  .15

;------------------------------------------------------------------ vectores
    ORG     0x000
    GOTO    INICIO

    ORG     0x004
    GOTO    ISR

;------------------------------------------------------------------ programa
INICIO
    BANKSEL ANSEL
    CLRF    ANSEL               ; todo digital
    CLRF    ANSELH

    BANKSEL TRISB
    MOVLW   b'11111000'
    MOVWF   TRISB               ; RB0..RB2 salidas (LEDs)
    MOVLW   b'10000000'
    MOVWF   TRISD               ; RD0..RD6 salidas (segmentos)
    MOVLW   b'11111100'
    MOVWF   TRISC               ; RC0..RC1 salidas (ánodos)
    BSF     TRISA, 0            ; RA0 entrada (pulsador)

    BANKSEL PORTB
    CLRF    PORTB
    CLRF    PORTD
    CLRF    PORTC

    CLRF    FASE

BUCLE_PRINCIPAL
    CALL    CARGAR_FASE         ; enciende el LED y carga SEGUNDOS
CUENTA
    CALL    MOSTRAR_CUENTA      ; refresca el display durante 1 segundo
    DECFSZ  SEGUNDOS, F
    GOTO    CUENTA

    INCF    FASE, F
    MOVLW   .3
    SUBWF   FASE, W
    BTFSC   STATUS, Z
    CLRF    FASE                ; después de rojo, vuelve a verde
    GOTO    BUCLE_PRINCIPAL

;------------------------------------------------- enciende la luz de la fase
CARGAR_FASE
    BANKSEL PORTB
    CLRF    PORTB
    MOVF    FASE, W
    BTFSC   STATUS, Z
    GOTO    FASE_VERDE
    XORLW   .1
    BTFSC   STATUS, Z
    GOTO    FASE_AMARILLO

FASE_ROJA
    BSF     PORTB, 0
    MOVLW   T_ROJO
    MOVWF   SEGUNDOS
    RETURN

FASE_AMARILLO
    BSF     PORTB, 1
    MOVLW   T_AMARILLO
    MOVWF   SEGUNDOS
    RETURN

FASE_VERDE
    BSF     PORTB, 2
    MOVLW   T_VERDE
    MOVWF   SEGUNDOS
    RETURN

;-------------------------------------------------------- rutinas auxiliares
    #INCLUDE  "inc/display7seg.inc"
    #INCLUDE  "inc/retardos.inc"

;------------------------------------------------------------------------ ISR
ISR
    MOVWF   AUX_W               ; guardar contexto
    SWAPF   STATUS, W
    MOVWF   AUX_STATUS

    ; (sin interrupciones activas por ahora)

    SWAPF   AUX_STATUS, W       ; restaurar contexto
    MOVWF   STATUS
    SWAPF   AUX_W, F
    SWAPF   AUX_W, W
    RETFIE

    END
