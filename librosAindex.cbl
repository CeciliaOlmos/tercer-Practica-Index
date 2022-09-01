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
           SELECT LIB ASSIGN TO "..\libros.txt"
           ORGANIZATION LINE SEQUENTIAL.
           SELECT LIBROS ASSIGN TO "..\libros.dat"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS lib-llave.

       DATA DIVISION.
       FILE SECTION.
       FD  LIBROS.
       01  lib-reg.
           03 lib-llave.
               05 lib-cod-libreria pic x(6).
               05 lib-cod-libro pic x(6).
           03 lib-nombre pic x(20).
           03 lib-stock pic 9(3).
       FD  LIB.
       01  lib-tex-reg.
           03 lib-tex-libreria pic x(6).
           03 lib-tex-libro pic x(6).
           03 lib-tex-nombre pic x(20).
           03 lib-tex-stock pic 9(3).
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
           OPEN OUTPUT LIBROS.
       200-LEER-ARCH-FACT.
           READ LIB AT END MOVE 1 TO w-flag.
       300-PROCESO.
           MOVE lib-tex-libreria to lib-cod-libreria.
           MOVE lib-tex-libro to lib-cod-libro.
           MOVE lib-tex-nombre to lib-nombre.
           MOVE lib-tex-stock to lib-stock.
           WRITE lib-reg.
           DISPLAY lib-reg.

       400-FIN.
           CLOSE LIB.
           CLOSE LIBROS.

       END PROGRAM YOUR-PROGRAM-NAME.
