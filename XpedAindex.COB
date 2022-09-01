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
           SELECT LIPED ASSIGN TO "..\libroxpedido.txt"
           ORGANIZATION LINE SEQUENTIAL.
           SELECT LIBXPEDIDO ASSIGN TO "..\libroxpedido.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS libX-llave.

       DATA DIVISION.
       FILE SECTION.
       FD  LIBXPEDIDO.
       01  libX-reg.
           03 libX-llave.
               05 libX-zona pic 9(2).
               05 libX-nro-pedido pic 9(8).
               05 libX-cod-libro pic x(6).
           03 libX-cant pic 9(3).
       FD  LIPED.
       01  lib-tex-reg.
           03 lib-tex-zona pic 9(2).
           03 lib-tex-pedido pic 9(8).
           03 lib-tex-libro pic x(6).
           03 lib-tex-cant pic 9(3).
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
           OPEN INPUT LIPED.
           OPEN OUTPUT LIBXPEDIDO.
       200-LEER-ARCH-FACT.
           READ LIPED AT END MOVE 1 TO w-flag.
       300-PROCESO.
           MOVE lib-tex-zona TO libX-zona.
           MOVE lib-tex-pedido TO libX-nro-pedido.
           MOVE lib-tex-libro TO libX-cod-libro.
           MOVE lib-tex-cant TO libX-cant.
           WRITE libX-reg.
           DISPLAY libX-reg.

       400-FIN.
           CLOSE LIPED.
           CLOSE LIBXPEDIDO.

       END PROGRAM YOUR-PROGRAM-NAME.
