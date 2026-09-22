CLASS zcl_00_demo_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA age         TYPE i          VALUE 44.
    DATA gender      TYPE c LENGTH 1 VALUE 'M'.
    DATA family_name TYPE string     VALUE 'Appenmaier'.
    DATA first_name  TYPE string     VALUE 'Daniel'.

    " Comparison Operators: <, <=, >, >=, =, <>
    " Logical Operators: AND, OR, NOT

    " Branches
    IF age > 17 AND ( gender = 'M' OR gender = 'm' ).
      out->write( |Hello Mister { family_name }| ).
    ELSEIF age > 17 AND ( gender = 'W' OR gender = 'w' ).
      out->write( |Hello Miss { family_name }| ).
    ELSE.
      out->write( |Hello { first_name }| ).
    ENDIF.

    out->write( |Hello { COND #( WHEN age > 17 AND ( gender = 'M' OR gender = 'm' ) THEN |Mister { family_name }|
                                 WHEN age > 17 AND ( gender = 'W' OR gender = 'w' ) THEN |Miss { family_name }|
                                 ELSE                                                    first_name ) }| ).

    CLEAR age. " age = 0.
    IF age IS INITIAL. " IF age = 0.
      out->write( 'age is initial' ).
    ENDIF.

    " Cases
    CASE gender.
      WHEN 'M' OR 'm'.
        out->write( 'male' ).
      WHEN 'W' OR 'w'.
        out->write( 'female' ).
      WHEN 'D' OR 'd'.
        out->write( 'divers' ).
      WHEN OTHERS.
        out->write( 'invalid' ).
    ENDCASE.

    out->write( |{ SWITCH #( gender
                             WHEN 'M' OR 'm' THEN `male`
                             WHEN 'W' OR 'w' THEN `female`
                             WHEN 'D' OR 'd' THEN `divers`
                             ELSE                 `invalid` ) }| ).
  ENDMETHOD.
ENDCLASS.
