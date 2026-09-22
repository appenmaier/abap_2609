CLASS zcl_00_abap_02 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_02 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer_Id  TYPE /dmo/customer_id.
    DATA first_name   TYPE /dmo/first_name.
    DATA last_name    TYPE /dmo/last_name.
    DATA city         TYPE /dmo/city.
    DATA country_code TYPE land1.

    customer_id = '182763'.
    first_name = 'Bruce'.
    last_name = 'Wayne'.
    city = 'Gotham'.
    country_code = 'US'.

    out->write( customer_id ).
    out->write( first_name ).
    out->write( last_name ).
    out->write( city ).
    out->write( country_code ).
  ENDMETHOD.
ENDCLASS.
