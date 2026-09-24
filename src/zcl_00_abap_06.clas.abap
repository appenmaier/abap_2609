CLASS zcl_00_abap_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( zcl_00_helper=>get_travel_with_customer( '00000001' ) ).
      CATCH zcx_abap_no_data into data(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
