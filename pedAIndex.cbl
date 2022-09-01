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
           SELECT PED ASSIGN TO "..\pedidos.txt"
           ORGANIZATION LINE SEQUENTIAL.
           SELECT PEDIDOS ASSIGN TO "..\pedidos.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS ped-llave.
       DATA DIVISION.
       FILE SECTION.
       FD  PEDIDOS.
       01  ped-reg.
           03 ped-llave.
               05 ped-zona pic 9(2).
               05 ped-pedido pic 9(8).
           03 ped-fecha pic x(8).
           03 ped-cliente pic 9(6).

       FD  PED.
       01  ped-tex-reg.
           03 ped-tex-zona pic 9(2).
           03 ped-tex-pedido pic 9(8).
           03 ped-tex-fecha pic x(8).
           03 ped-tex-cliente pic 9(6).
       WORKING-STORAGE SECTION.
       77  w-flag pic 9.
           88 fin-archivo value 1.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
             PERFORM 100-INICIO.
           PERFORM 200-LEER-ARCH-FACT.
           PERFORM UNTIL fin-archivo
            PERFORM 300-PROCESO
            PERFORM 200-LEER-ARCH-FACT
           END-PERFORM.
           PERFORM 400-FIN.
            STOP RUN.
       100-INICIO.
           OPEN INPUT PED.
           OPEN OUTPUT PEDIDOS.
       200-LEER-ARCH-FACT.
           READ PED AT END MOVE 1 TO w-flag.
       300-PROCESO.
           MOVE ped-tex-zona to ped-zona.
           MOVE ped-tex-pedido to ped-pedido.
           MOVE ped-tex-fecha to ped-fecha.
           MOVE ped-tex-cliente to ped-cliente.
           WRITE ped-reg.
           DISPLAY ped-reg.

       400-FIN.
           CLOSE PED.
           CLOSE PEDIDOS.
       END PROGRAM YOUR-PROGRAM-NAME.
