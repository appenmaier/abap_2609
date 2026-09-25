CLASS zcl_00_carrier DEFINITION
  PUBLIC
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES zif_00_partner.

    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z00_airplanes READ-ONLY.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_00_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_00_cargo_plane.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane TO airplanes. " airplanes = VALUE #( BASE airplanes ( airplane ) ).
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA biggest_total_weight_in_tons TYPE i.

    LOOP AT airplanes INTO DATA(airplane) WHERE table_line IS INSTANCE OF zcl_00_cargo_plane.
      DATA(cargo_plane) = CAST zcl_00_cargo_plane( airplane ). " Downcast

      IF cargo_plane->get_total_weight_int_tons( ) > biggest_total_weight_in_tons.
        biggest_total_weight_in_tons = cargo_plane->get_total_weight_int_tons( ).
        biggest_cargo_plane = cargo_plane.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_00_partner~get_info.
    info = |{ name }: { lines( airplanes ) } airplanes|.
  ENDMETHOD.
ENDCLASS.
