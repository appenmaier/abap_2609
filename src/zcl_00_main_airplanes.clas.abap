CLASS zcl_00_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA agency   TYPE REF TO zcl_00_travel_agency.
    DATA carrier  TYPE REF TO zcl_00_carrier.
    DATA airplane TYPE REF TO zcl_00_airplane.
    DATA vehicle  TYPE REF TO zcl_00_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_00_vehicle.
    DATA rental   TYPE REF TO zcl_00_rental.
    DATA rental2  TYPE REF TO zcl_00_rental.

    " Object Creations
    agency = NEW #( 'TUII' ).

    carrier = NEW #( 'Lufthans' ).

    TRY.
        airplane = NEW zcl_00_passenger_plane( id                   = 'D-ABUK'
                                               plane_type           = 'Airbus A380-800'
                                               empty_weight_in_tons = 277
                                               number_of_seats      = 800 ). " Upcast
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_00_passenger_plane( id                   = 'D-AIND'
                                               plane_type           = 'Airbus A320-200'
                                               empty_weight_in_tons = 42
                                               number_of_seats      = 200 ). " Upcast
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_00_cargo_plane( id                   = 'D-AJKF'
                                           plane_type           = 'Boeing 747-400F'
                                           empty_weight_in_tons = 166
                                           cargo_in_tons        = 400 ). " Upcast
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

    TRY.
        airplane = NEW zcl_00_cargo_plane( id                   = 'D-AHUF'
                                           plane_type           = 'Boeing 747-500F'
                                           empty_weight_in_tons = 170
                                           cargo_in_tons        = 450 ). " Upcast
        carrier->add_airplane( airplane ).
      CATCH zcx_abap_initial_parameter INTO x.
        out->write( x->get_text( ) ).
    ENDTRY.

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

    agency->add_partner( carrier ).
    agency->add_partner( rental ).
    agency->add_partner( rental2 ).
    agency->add_partner( NEW zcl_16_carrier( 'Mein Carrier' ) ).
    agency->add_partner( NEW zcl_08_carrier( 'Trump Airlines' ) ).

    " Output
    out->write( agency->get_info( ) ).
  ENDMETHOD.
ENDCLASS.
