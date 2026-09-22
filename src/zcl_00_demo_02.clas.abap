CLASS zcl_00_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_02 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.


    DATA result_i TYPE i.
    DATA result_p TYPE p LENGTH 16 DECIMALS 4.


    " Arithmetic Operators
    result_i = 5 + 3.
    out->write( |5 + 3 = { result_i }| ).

    result_i = 5 - 3.
    out->write( |5 - 3 = { result_i }| ).

    result_i = 5 * 3.
    out->write( |5 * 3 = { result_i }| ).

    result_i = 5 / 3.
    out->write( |5 / 3 = { result_i }| ).

    result_p = 5 / 3.
    out->write( |5 / 3 = { result_p }| ).

    result_i = 5 DIV 3.
    out->write( |5 DIV 3 = { result_i }| ).

    result_i = 5 MOD 3.
    out->write( |5 MOD 3 = { result_i }| ).

    " Increment/Decrement
    result_i = 0.
    result_i = result_i + 1.
    result_i += 1.

    out->write( result_i ).

    " Numeric Functions
    result_i = abs( -3 ).
    out->write( result_i ).

    out->write( |3.1492789 rounded: { round( val = '3.1492789'
                                             dec = 2 ) }| ).
  ENDMETHOD.

ENDCLASS.
