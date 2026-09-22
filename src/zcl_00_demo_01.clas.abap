CLASS zcl_00_demo_01 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA age        TYPE i.
    DATA name       TYPE c LENGTH 40.
    DATA user_id    TYPE n LENGTH 6.
    DATA birth_date TYPE d.
    DATA birth_time TYPE t.
    DATA male       TYPE c LENGTH 1.
    DATA size_in_m  TYPE p LENGTH 16 DECIMALS 2.

    age = 44.
    name = 'Daniel Appenmaier'.
    user_id = '054906'.
    birth_date = '19820104'.
    birth_time = '043451'.
    male = 'X'.
    size_in_m = '179.10'.

    out->write( age ).
    out->write( name ).
    out->write( user_id ).
    out->write( birth_date ).
    out->write( birth_time ).
    out->write( male ).
    out->write( size_in_m ).
  ENDMETHOD.
ENDCLASS.
