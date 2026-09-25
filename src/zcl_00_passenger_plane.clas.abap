CLASS zcl_00_passenger_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA number_of_seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                number_of_seats      TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_int_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_00_passenger_plane IMPLEMENTATION.
  METHOD constructor.
    IF number_of_seats IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'number_of_seats' ).
    ENDIF.

    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).
    me->number_of_seats = number_of_seats.
  ENDMETHOD.

  METHOD get_total_weight_int_tons.
    total_weight_in_tons = super->get_total_weight_int_tons( ) + number_of_seats * '0.08'.
  ENDMETHOD.
ENDCLASS.
