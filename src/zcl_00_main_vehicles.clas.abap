CLASS zcl_00_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    "DATA vehicle TYPE z00_vehicle.
    "vehicle-make = 'Porsche'.
    "vehicle-model = '911'.
    "vehicle-speed_in_kmh = 250.

    DATA vehicle TYPE REF TO zcl_00_vehicle.
    vehicle = NEW zcl_00_vehicle( make = 'Porsche' model = '911' ).
    " vehicle = new #( make = 'Porsche' model = '911' ).

    vehicle->accelerate( 80 ).
    vehicle->brake( 40 ).
    vehicle->accelerate( 100 ).
    out->write( vehicle->to_string( ) ).

  ENDMETHOD.


ENDCLASS.
