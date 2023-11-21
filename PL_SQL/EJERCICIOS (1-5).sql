
1) Escribe un procedimiento que reciba dos números y visualice su suma.

      CREATE PROCEDURE SumarNumeros(numero1 IN NUMBER, numero2 IN NUMBER) IS
      BEGIN
          DBMS_OUTPUT.PUT_LINE('La suma de ' || numero1 || ' y ' || numero2 || ' es igual a: ' || (numero1 + numero2));
      END;
       /

      BEGIN
        SumarNumeros(10, 3);
      END;
      /

2) Codifica un procedimiento que reciba una cadena y la visualice al revés.

     CREATE PROCEDURE CadenaReves(cadena IN VARCHAR2) IS
         cadena_reves VARCHAR2(4000);
       BEGIN
          cadena_reves := '';

        FOR i IN REVERSE 1..LENGTH(cadena) LOOP
            cadena_reves := cadena_reves || SUBSTR(cadena, i, 1);
         END LOOP;

           DBMS_OUTPUT.PUT_LINE('Cadena original: ' || cadena);
           DBMS_OUTPUT.PUT_LINE('Cadena al revés: ' || cadena_reves);
          END;
         /

       BEGIN
        CadenaReves('Hola Diego al reves');
        END;
       /

3) Reescribe el código de los dos ejercicios anteriores para convertirlos en funciones que retornen los valores que mostraban los procedimientos.

        CREATE OR REPLACE FUNCTION SumarNumeros(numero1 IN NUMBER, numero2 IN NUMBER) RETURN NUMBER IS
         BEGIN

          RETURN numero1 + numero2;
         END;
        /


        DECLARE
          resultado NUMBER;
        BEGIN
          resultado := SumarNumeros(10, 3);
          DBMS_OUTPUT.PUT_LINE('La suma de los números es igual a: ' || resultado);
         END;
        /

        ---------------------------------------------------------------------------

       CREATE OR REPLACE FUNCTION CadenaReves(cadena IN VARCHAR2) RETURN VARCHAR2 IS
           cadena_reves VARCHAR2(4000);
        BEGIN
         cadena_reves := '';

    
        FOR i IN REVERSE 1..LENGTH(cadena) LOOP
            cadena_reves := cadena_reves || SUBSTR(cadena, i, 1);
        END LOOP;

    
        RETURN cadena_reves;
       END;
      /


       DECLARE
          cadena_reves VARCHAR2(4000);
       BEGIN
          cadena_reves := CadenaReves('Hola Diego al reves');
          DBMS_OUTPUT.PUT_LINE('Cadena original: Hola Diego al reves');
          DBMS_OUTPUT.PUT_LINE('Cadena al revés: ' || cadena_reves);
       END;
      /


4)Escribe una función que reciba una fecha y devuelva el año, en número, correspondiente a esa fecha.

     CREATE OR REPLACE FUNCTION DevolverAnio(fecha DATE) RETURN NUMBER IS
     BEGIN
  
        RETURN EXTRACT(YEAR FROM fecha);
     END;
     /


5)Escribe un bloque PL/SQL que haga uso de la función anterior.
     DECLARE
        anio NUMBER;
     BEGIN
  
        anio := DevolverAnio(TO_DATE('15-NOV-2023', 'DD-MON-YYYY'));
        DBMS_OUTPUT.PUT_LINE('El año es: ' || anio);
     END;
     /



