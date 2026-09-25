CLASS zcl_00_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_airplane
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !id                  TYPE string
                plane_type           TYPE string
                empty_weight_in_tons TYPE i
                cargo_in_tons        TYPE i
      RAISING   zcx_abap_initial_parameter.

    METHODS get_total_weight_int_tons REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_00_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    IF cargo_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'cargo_in_tons' ).
    ENDIF.

    super->constructor( id                   = id
                        plane_type           = plane_type
                        empty_weight_in_tons = empty_weight_in_tons ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD get_total_weight_int_tons.
    total_weight_in_tons = super->get_total_weight_int_tons( ) + cargo_in_tons.
  ENDMETHOD.
ENDCLASS.
