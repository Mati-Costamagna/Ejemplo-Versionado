;==============================================================================
; config.inc  -  Bits de configuración del PIC16F887
; Oscilador externo XT de 4 MHz, watchdog apagado, MCLR externo.
;==============================================================================

    __CONFIG _CONFIG1, _XT_OSC & _WDT_OFF & _PWRTE_ON & _MCLRE_ON & _CP_OFF & _BOR_OFF & _LVP_OFF
    __CONFIG _CONFIG2, _BOR21V

; Frecuencia del cristal: la usan las rutinas de retardo.
_XTAL_FREQ  EQU  .4000000
