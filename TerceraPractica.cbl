      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT PEDIDOS ASSIGN TO "..\pedidos.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS ped-llave.
           SELECT LIBXPEDIDO ASSIGN TO "..\libroxpedido.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS libX-llave.
           SELECT LIBRERIAS ASSIGN TO "..\librerias.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS libreria-llave.
       DATA DIVISION.
       FILE SECTION.
       FD  PEDIDOS.
       01  ped-reg.
           03 ped-llave.
               05 ped-zona pic 9(2).
               05 ped-pedido pic 9(8).
           03 ped-fecha pic x(8).
           03 ped-cliente pic 9(6).
       FD  LIBXPEDIDO.
       01  libX-reg.
           03 libX-llave.
               05 libX-zona pic 9(2).
               05 libX-nro-pedido pic 9(8).
               05 libX-cod-libro pic x(6).
           03 libX-cant pic 9(3).
       FD  LIBRERIAS.
       01  libreria-reg.
           03 libreria-llave.
               05 libreria-zona pic 9(2).
               05 libreria-calif pic 9(3).
               05 libreria-cod pic x(6).
           03 libreria-razsoc pic x(20).
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
