CLASS zcl_00_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_00_partner.

    DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.
ENDCLASS.


CLASS zcl_00_rental IMPLEMENTATION.
  METHOD zif_00_partner~get_info.
    LOOP AT vehicles INTO DATA(vehicle).
      info &&= |{ vehicle->to_string( ) }, |.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
