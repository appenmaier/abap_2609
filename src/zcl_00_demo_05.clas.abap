CLASS zcl_00_demo_05 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_05 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " pre-test loop
    WHILE sy-index < 11.
      out->write( sy-index ).
    ENDWHILE.

    " index loop
    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    " infinite loop
    DO.
      IF sy-index = 11.
        EXIT.
      ENDIF.
      out->write( sy-index ).
    ENDDO.
  ENDMETHOD.
ENDCLASS.
