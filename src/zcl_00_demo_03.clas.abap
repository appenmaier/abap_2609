CLASS zcl_00_demo_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA text1      TYPE string VALUE 'Hello'.
    DATA birth_date TYPE d      VALUE '19820401'.

    DATA(text2) = 'World'.

    DATA(text3) = |{ text1 } { text2 }|.

    out->write( text3 ).
    out->write( |{ text1 } { text2 }| ).

    out->write( |Birth Date: { birth_date DATE = USER }| ).

    out->write( strlen( 'Daniel' ) ).
    out->write( strlen( 'Daniel          ' ) ).
  ENDMETHOD.
ENDCLASS.
