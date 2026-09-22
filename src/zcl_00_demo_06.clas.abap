CLASS zcl_00_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    " System Fields
    out->write( |User Name: { sy-uname }| ).
    out->write( |Client: { sy-mandt }| ).
    out->write( |Language: { sy-langu }| ).
    out->write( |Date (Server): { sy-datum DATE = USER }| ).
    out->write( |Time (Server): { sy-uzeit TIME = USER }| ).
    out->write( |Date (Client): { sy-datlo DATE = USER }| ).
    out->write( |Time (Client): { sy-timlo TIME = USER }| ).

    " Context Information
    out->write( cl_abap_context_info=>get_system_date( ) ).
    out->write( cl_abap_context_info=>get_system_time( ) ).
    out->write( cl_abap_context_info=>get_user_formatted_name( ) ).
  ENDMETHOD.
ENDCLASS.
