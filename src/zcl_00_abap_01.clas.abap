CLASS zcl_00_abap_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA first_name TYPE c LENGTH 20. " Deklaration
    DATA last_name  TYPE c LENGTH 20. " Deklaration

    first_name = 'Christian'. " Wertzuweisung
    last_name = 'Klein'.

    out->write( |Hello { first_name } { last_name }, how are u?| ).
    out->write( 'Philipp war hier' ).

    out->write( 'Klammern in ABAP sind extrem komisch' ).
  ENDMETHOD.
ENDCLASS.
