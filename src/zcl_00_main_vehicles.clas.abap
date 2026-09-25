CLASS zcl_00_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle     TYPE REF TO zcl_00_vehicle.
    DATA vehicles    TYPE TABLE OF REF TO zcl_00_vehicle.
    DATA rental      TYPE REF TO zcl_00_rental.
    DATA rental2     TYPE REF TO zcl_00_rental.
    DATA car         TYPE REF TO zcl_00_car.
    DATA total_seats TYPE i.
    DATA partners    TYPE TABLE OF REF TO zif_00_partner.

    " Instantiations
    vehicle = NEW zcl_00_car( make  = 'Audi'
                              model = 'R8'
                              seats = 2 ). " Upcast
    APPEND vehicle TO vehicles.
    vehicle = NEW zcl_00_truck( make          = 'MAN'
                                model         = 'TGX'
                                cargo_in_tons = 40 ). " Upcast
    APPEND vehicle TO vehicles.
    vehicle = NEW zcl_00_car( make  = 'VW'
                              model = 'Golf'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.
    vehicle = NEW zcl_00_car( make  = 'Opel'
                              model = 'Astra'
                              seats = 5 ). " Upcast
    APPEND vehicle TO vehicles.

    rental = NEW #( ).
    APPEND vehicles[ 1 ] TO rental->vehicles.
    APPEND vehicles[ 3 ] TO rental->vehicles.
    APPEND vehicles[ 4 ] TO rental->vehicles.

    rental2 = NEW #( ).
    APPEND vehicles[ 2 ] TO rental2->vehicles.

    " Output
    LOOP AT vehicles INTO vehicle.
      vehicle->accelerate( 50 ).
      out->write( vehicle->to_string( ) ). " Dynamic Polymorphism
      IF vehicle IS INSTANCE OF zcl_00_car.
        car = CAST #( vehicle ). " Downcast
        total_seats += car->seats.
      ENDIF.
    ENDLOOP.
    out->write( total_seats ).

    APPEND rental TO partners. " Upcast
    APPEND rental2 TO partners. " Upcast
    APPEND NEW zcl_00_hotel( ) TO partners. " Upcast

    LOOP AT partners INTO DATA(partner).
      out->write( partner->get_info( ) ). " Polymorphism
      IF partner IS INSTANCE OF zcl_00_rental.
        rental = CAST #( partner ). " Downcast
        out->write( |Rental| ).
      ENDIF.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
