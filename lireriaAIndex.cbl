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
           SELECT LIB ASSIGN TO "..\librerias.txt"
           ORGANIZATION LINE SEQUENTIAL.
           SELECT LIBRERIAS ASSIGN TO "..\librerias.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS libreria-llave.

       DATA DIVISION.
       FILE SECTION.
       FD  LIBRERIAS.
       01  libreria-reg.
           03 libreria-llave.
               05 libreria-zona pic 9(2).
               05 libreria-calif pic 9(3).
               05 libreria-cod pic x(6).
           03 libreria-razsoc pic x(20).

       FD  LIB.
       01  lib-tex-reg.
           03 lib-tex-zona pic 9(2).
           03 lib-tex-calif pic 9(3).
           03 lib-tex-cod pic x(6).
           03 lib-tex-razsoc pic x(20).
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
           OPEN INPUT LIB.
           OPEN OUTPUT LIBRERIAS.
       200-LEER-ARCH-FACT.
           READ LIB AT END MOVE 1 TO w-flag.
       300-PROCESO.
           MOVE lib-tex-zona to libreria-zona.
           MOVE lib-tex-calif to libreria-calif.
           MOVE lib-tex-cod to libreria-cod.
           MOVE lib-tex-razsoc to libreria-razsoc.
           WRITE libreria-reg.
           DISPLAY libreria-reg.

       400-FIN.
           CLOSE LIB.
           CLOSE LIBRERIAS.
       END PROGRAM YOUR-PROGRAM-NAME.
